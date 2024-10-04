# Atlantis Test Project

This project demonstrates a simple Terraform configuration to create a random S3 bucket in the Singapore region, which can be used to test Atlantis (Terraform Automation tool) on Amazon Linux.

## Project Overview

This project sets up Atlantis, a Terraform automation tool, on an Amazon Linux EC2 instance. It includes a basic Terraform configuration to create an S3 bucket with a random name, showcasing how Atlantis can be used to manage infrastructure as code.

## Key Components

1. Terraform Configuration (`main.tf`)
2. Atlantis Setup Scripts (`install.sh` and `setup.sh`)
3. Advanced Setup Guide (`AdvancedSetup.md`)

## Terraform Configuration

The `main.tf` file contains the following resources:

- AWS provider configuration for the Singapore region (ap-southeast-1)
- S3 backend for storing Terraform state
- Random pet name generator for unique S3 bucket names
- S3 bucket resource

## Atlantis Setup

The setup process involves two main scripts:

1. `install.sh`: Installs necessary dependencies, Terraform, and Atlantis on the EC2 instance.
2. `setup.sh`: Configures Atlantis, including GitHub authentication, webhook setup, and systemd service creation.

## Getting Started

1. Launch an Amazon Linux EC2 instance.
2. Clone this repository to your EC2 instance.
3. Run the `install.sh` script to install required software.
4. Run the `setup.sh` script to configure Atlantis.
5. Configure your GitHub repository with the webhook details provided by the setup script.

For detailed instructions, refer to the `AdvancedSetup.md` file.

## Additional Information

For more detailed information about the project structure, configuration options, and advanced setup instructions, please refer to the `extra.md` file in this repository.

## Prerequisites

- AWS account with EC2 access
- GitHub account with repository access
- Basic knowledge of Terraform and AWS services

## Contributing

Contributions to improve this project are welcome. Please follow the standard GitHub pull request process to propose changes.

## License

[Specify your license here]
