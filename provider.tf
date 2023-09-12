terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {
    # Replace this with your bucket name!
    # bucket         = "my-terraform-three-tier-role"
    # key            = "infra.tfstate"
    # region         = "us-east-1"
    # profile        = "sham"
   }
}

# Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
#   profile = "sham"
  
# }
