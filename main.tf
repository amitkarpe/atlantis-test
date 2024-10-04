provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
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
resource "random_pet" "bucket_name" {
  length    = 3
  separator = "-"
}
resource "aws_s3_bucket" "test_bucket" {
  bucket = "atlantis-test-${random_pet.bucket_name.id}"
}