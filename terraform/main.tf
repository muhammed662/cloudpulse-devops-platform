provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "cloudpulse_sg" {
  name        = "cloudpulse-terraform-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cloudpulse-terraform-sg"
  }
}

resource "aws_instance" "cloudpulse" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "cloudpulse-key"
  vpc_security_group_ids = [aws_security_group.cloudpulse_sg.id]

  user_data = <<-EOF
#!/bin/bash
set -eux

apt-get update -y
apt-get install -y docker.io git nginx

systemctl enable docker
systemctl start docker

systemctl enable nginx

usermod -aG docker ubuntu

cd /home/ubuntu
rm -rf cloudpulse-devops-platform
git clone https://github.com/muhammed662/cloudpulse-devops-platform.git

cd /home/ubuntu/cloudpulse-devops-platform
docker rm -f cloudpulse-container || true
docker build -t cloudpulse-app .
docker run -d --name cloudpulse-container -p 5000:5000 cloudpulse-app

cat > /etc/nginx/sites-available/default <<'NGINXCONF'
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
NGINXCONF

nginx -t
systemctl restart nginx
EOF

  tags = {
    Name = "CloudPulse-Terraform"
  }
}

output "instance_public_ip" {
  value = aws_instance.cloudpulse.public_ip
}
