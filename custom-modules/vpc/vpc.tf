resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
 # Required for EKS(for futurre project). Enable/disable DNS support in the VPC.
  enable_dns_support = var.enable_dns_support
  # Required for EKS(for futurre project). Enable/disable DNS hostnames in the VPC.
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = "${var.vpc_name}"
  }
}