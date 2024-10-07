provider "aws" {
  region = var.region
}

############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "atlantis-tf-state-111111"
    key     = "atlantis/terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}

# Add random length
resource "random_pet" "bucket_name" {
  length    = 4
  separator = "-"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "${var.bucket_name_prefix}-${random_pet.bucket_name.id}"
}

variable "region" {
  type        = string
  description = "The AWS region to create resources in"
}

variable "bucket_name_prefix" {
  type        = string
  description = "Prefix for the S3 bucket name"
}