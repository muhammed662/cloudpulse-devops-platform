# Day 3 - Deploying CloudPulse to AWS EC2

## What I did
- Launched an Ubuntu EC2 instance on AWS
- Connected to the server using SSH with a .pem key
- Stored the SSH key securely in ~/.ssh
- Built the CloudPulse Docker image on EC2
- Ran the app inside a Docker container on the server
- Exposed the app on port 5000

## What I learned
- EC2 is a cloud virtual machine that can host applications
- SSH is used to securely connect to remote Linux servers
- ~/.ssh is the standard location for storing SSH keys
- chmod 400 secures private keys so SSH will accept them
- Docker can build and run the same app on a remote server just like locally
- The -d flag runs containers in the background
- The -p 5000:5000 option maps server port 5000 to the container port

## Issues faced
- SSH initially failed because the private key file permissions were too open
- Working with a key from the Windows Downloads path caused permission issues

## Fix / Solution
- Copied the .pem key into ~/.ssh inside Ubuntu
- Set secure permissions with chmod 400
- Re-ran SSH using the key from the Linux home directory

## Outcome
- Successfully deployed CloudPulse to AWS EC2 using Docker
- CloudPulse is now running on a remote cloud server
