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

# Create Atlantis configuration directory
sudo mkdir -p /etc/atlantis

# Create Atlantis configuration file
cat << EOF | sudo tee /etc/atlantis/atlantis.yaml
repos:
- id: /.*/
  apply_requirements: [approved]
  workflow: default
  allowed_overrides: [workflow]
  allow_custom_workflows: true

workflows:
  default:
    plan:
      steps:
      - init
      - plan
    apply:
      steps:
      - apply
EOF

# Prompt for GitHub access method
echo "Choose your GitHub access method:"
echo "1) GitHub User Token"
echo "2) GitHub App"
read -p "Enter your choice (1 or 2): " github_choice

if [ "$github_choice" == "1" ]; then
    read -p "Enter your GitHub username: " github_user
    read -p "Enter your GitHub personal access token: " github_token
    auth_config="--gh-user=\"$github_user\" --gh-token=\"$github_token\""
elif [ "$github_choice" == "2" ]; then
    read -p "Enter your GitHub App ID: " github_app_id
    read -p "Enter the path to your GitHub App private key file: " github_app_key_file
    read -p "Enter your GitHub App Installation ID: " github_installation_id
    auth_config="--gh-app-id=\"$github_app_id\" --gh-app-key-file=\"$github_app_key_file\" --gh-installation-id=\"$github_installation_id\""
else
    echo "Invalid choice. Exiting."
    exit 1
fi

read -p "Enter your EC2 public IP: " ec2_public_ip
read -p "Enter your GitHub webhook secret: " webhook_secret
read -p "Enter your GitHub repo allowlist (e.g., github.com/your-org/*): " repo_allowlist

# Create Atlantis systemd service file
cat << EOF | sudo tee /etc/systemd/system/atlantis.service
[Unit]
Description=Atlantis Terraform Automation
After=network.target

[Service]
Type=simple
User=ec2-user
ExecStart=/usr/local/bin/atlantis server \
  --atlantis-url="http://$ec2_public_ip:4141" \
  $auth_config \
  --gh-webhook-secret="$webhook_secret" \
  --repo-allowlist="$repo_allowlist" \
  --repo-config="/etc/atlantis/atlantis.yaml"
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Enable and start Atlantis service
sudo systemctl enable atlantis
sudo systemctl start atlantis

echo "Atlantis setup complete. Please configure your GitHub webhook with the following details:"
echo "Payload URL: http://$ec2_public_ip:4141/events"
echo "Content type: application/json"
echo "Secret: $webhook_secret"
echo "Events: Select 'Pull request reviews', 'Pushes', and 'Issue comments'"