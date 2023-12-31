terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
   backend "s3" {
    # Replace this with your bucket name!
    bucket         = "my-terraform-tfstate-three-tiers"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    # profile        = "sham"
    # role_arn       = "arn:aws:iam::968017969736:role/my-terraform-three-tier-role"
   }
}

#Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # profile = "sham"
  #role_arn = "arn:aws:iam::968017969736:role/my-terraform-three-tier-role"
  
}
