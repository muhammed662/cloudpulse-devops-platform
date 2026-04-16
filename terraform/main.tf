provider "aws" {
  region = "us-east-1"
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
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.cloudpulse_sg.id]

  tags = {
    Name = "CloudPulse-Terraform"
  }
}

output "instance_public_ip" {
  value = aws_instance.cloudpulse.public_ip
}
