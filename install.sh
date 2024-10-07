#!/bin/bash

# Update system and install dependencies
sudo yum update -y
sudo yum install -y yum-utils shadow-utils wget

# Install Terraform
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# Install Atlantis
sudo wget https://github.com/runatlantis/atlantis/releases/latest/download/atlantis_linux_amd64.tar.gz
sudo tar -xvf atlantis_linux_amd64.tar.gz -C /usr/local/bin
sudo rm atlantis_linux_amd64.tar.gz

# Install Terragrunt
TERRAGRUNT_VERSION=v0.45.0  # Replace with the desired version
sudo wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -O /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt
