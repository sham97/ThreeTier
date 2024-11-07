resource "aws_subnet" "main" {
  vpc_id                         = var.vpc_id
  cidr_block                     = "${var.public_subnet_cidr_block}"
  availability_zone              = var.availability_zone

  tags = {
    Name = "${var.public_subnet_tag}-public_subnet"
  }
}