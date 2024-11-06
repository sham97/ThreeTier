module "IAM" {
    source = "./custom-modules/IAM"

    users = var.user
  
}

# vpc module
module "vpc" {
    source                  = "../../custom-modules/vpc"
    vpc_name                = "${local.environment}-vpc"
    enable_dns_hostnames    = true
    enable_dns_support      = true
    vpc_cidr_block          = var.vpc_cidr_block 
}