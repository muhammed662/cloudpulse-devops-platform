# Day 8 - Terraform + Full Automation Setup

## What I did

* Installed AWS CLI on the old EC2 to manage cloud resources
* Created a dedicated `terraform` directory inside the project
* Wrote initial `main.tf` to provision EC2 and security groups
* Ran `terraform init`, `plan`, and `apply` to launch a new EC2 instance
* Faced issue where instance was created but app was not running
* Identified that EC2 was Amazon Linux but script was written for Ubuntu
* Switched to Ubuntu AMI using dynamic AMI lookup
* Updated `user_data` to automatically:

  * install Docker and Git
  * clone GitHub repo
  * build and run Docker container
* Successfully launched a fully working app via Terraform
* Fixed SSH access issues (key path, permissions, username mismatch)
* Updated GitHub Actions `deploy.yml`:

  * corrected EC2 host (new IP)
  * fixed project directory path
  * aligned Docker port mapping
* Fixed CI/CD deployment errors on new EC2
* Implemented Nginx as reverse proxy:

  * installed Nginx manually on EC2
  * configured reverse proxy (port 80 → 5000)
  * verified app works without `:5000`
* Updated Terraform again to include:

  * Nginx installation
  * automatic Nginx configuration
* Recreated EC2 using Terraform to apply full automation

## What I learned

* Terraform provisions infrastructure, not application setup unless configured
* `user_data` runs only during instance creation
* Changing `user_data` requires recreating EC2 (immutable infrastructure)
* AMI choice must match the commands used in setup scripts
* Difference between Docker port mapping vs Nginx reverse proxy
* CI/CD pipelines must match infrastructure changes (IP, paths, ports)
* SSH key handling in WSL requires correct path and permissions
* Fully automated systems reduce manual errors and improve reproducibility

## Issues faced

* EC2 created but Docker and app not installed
* Used Ubuntu commands on Amazon Linux
* SSH key permission errors (`UNPROTECTED PRIVATE KEY FILE`)
* Wrong SSH user (`ec2-user` vs `ubuntu`)
* GitHub Actions deploying to old EC2
* Wrong project directory in CI/CD (`~/cloudpulse` vs correct path)
* App initially exposed via Docker instead of Nginx
* Terraform error: unclosed configuration block
* Nginx not installed in automated setup initially

## Fix / Solution

* Switched AMI to Ubuntu for compatibility
* Corrected `user_data` script for full automation
* Fixed SSH by:

  * copying key to `~/.ssh`
  * setting `chmod 400`
  * using correct username
* Updated GitHub secrets with new EC2 IP
* Fixed CI/CD workflow paths and ports
* Installed and configured Nginx properly
* Integrated Nginx setup into Terraform
* Rewrote `main.tf` to fix syntax errors
* Recreated EC2 using Terraform to apply all changes

