# Additional Information for Atlantis Test Project

## Project Structure

- `main.tf`: Main Terraform configuration file
- `install.sh`: Script to install Terraform and Atlantis
- `setup.sh`: Script to configure Atlantis
- `AdvancedSetup.md`: Detailed guide for setting up Atlantis on EC2
- `.terraform.lock.hcl`: Terraform dependency lock file
- `.gitignore`: Git ignore file for Terraform projects

## Atlantis Configuration

The `setup.sh` script creates an Atlantis configuration file at `/etc/atlantis/atlantis.yaml` with the following settings:

- Apply requirements: Approved pull requests
- Default workflow: init, plan, apply
- Custom workflows: Allowed

## GitHub Integration

Atlantis can be configured with either a GitHub User Token or a GitHub App. The setup script prompts for the preferred method and configures Atlantis accordingly.

## Security Considerations

- The EC2 instance should have a security group allowing inbound traffic on ports 22 (SSH) and 4141 (Atlantis).
- Use IAM roles for EC2 to manage AWS permissions securely.
- Store sensitive information (like GitHub tokens) securely and avoid committing them to version control.

## Terraform State Management

The project uses an S3 backend to store Terraform state files. Ensure that the S3 bucket specified in `main.tf` exists and is properly configured for state locking.

## Recommended VS Code Extensions

The `.vscode/extensions.json` file recommends several useful extensions for working with this project, including:

- Terraform support
- AWS Toolkit
- Git integration tools
- Markdown support

## Customization

- Modify the `main.tf` file to add or change AWS resources as needed for your project.
- Adjust the Atlantis configuration in `setup.sh` to match your workflow requirements.
- Update the EC2 instance type and region in the setup instructions if needed.

## Troubleshooting

- If Atlantis fails to start, check the systemd logs using `sudo journalctl -u atlantis`.
- Ensure that the GitHub webhook is properly configured with the correct URL and secret.
- Verify that the EC2 instance has the necessary IAM permissions to create and manage the specified AWS resources.
