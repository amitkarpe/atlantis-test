terraform {
  source = "./"
}

inputs = {
  region = "ap-southeast-1"
  bucket_name_prefix = "atlantis-terragrunt-test"
}

remote_state {
  backend = "s3"
  config = {
    bucket  = "atlantis-tf-state-111111"
#    key     = "atlantis-terragrunt/${path_relative_to_include()}/terraform.tfstate"
    key     = "atlantis-terragrunt/terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}