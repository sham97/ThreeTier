module "IAM" {
    source = "./custom-modules/IAM"

    users = var.owner_name
  
}

# vpc module
module "vpc" {
    source                      = "../../custom-modules/vpc"
    vpc_name                    = "${local.environment}-vpc"
    enable_dns_hostnames        = true
    enable_dns_support          = true
    vpc_cidr_block              = var.vpc_cidr_block 
}
module "public_subnet_1" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1a"
    public_subnet_cidr_block    = "10.0.150.0/24"
    public_subnet_tag           = "${local.environment}-public_subnet1"
}
module "public_subnet_2" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1b"
    public_subnet_cidr_block    = "10.0.151.0/24"
    public_subnet_tag           = "${local.environment}-public_subnet2"
}
module "private_subnet_1" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1a"
    public_subnet_cidr_block    = "10.0.1.0/24"
    public_subnet_tag           = "${local.environment}-private_subnet1"
}
module "private_subnet_2" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1b"
    public_subnet_cidr_block    = "10.0.2.0/24"
    public_subnet_tag           = "${local.environment}-private_subnet2"
}
module "database_subnet_1" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1a"
    public_subnet_cidr_block    = "10.0.50.0/24"
    public_subnet_tag           = "${local.environment}-database_subnet1"
}
module "database_subnet_2" {
    source                      = "../../custom-modules/subnets"
    vpc_id                      = module.vpc.vpc_id
    availability_zone           = "us-east-1b"
    public_subnet_cidr_block    = "10.0.51.0/24"
    public_subnet_tag           = "${local.environment}-database_subnet2"
}