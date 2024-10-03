# Advanced Atlantis Setup on Amazon Linux EC2

This guide provides detailed instructions for setting up Atlantis on an Amazon Linux EC2 instance.

## Prerequisites

1. An AWS account with EC2 access
2. A GitHub account with repository access
3. Basic knowledge of Terraform and AWS services

## Step 1: Launch an EC2 Instance

1. Log in to your AWS Console and navigate to EC2.
2. Launch a new EC2 instance using Amazon Linux 2 AMI.
3. Configure security groups to allow inbound traffic on ports 22 (SSH) and 4141 (Atlantis).
4. Create or use an existing key pair for SSH access.

## Step 2: Install Required Software

SSH into your EC2 instance and run the following commands:
