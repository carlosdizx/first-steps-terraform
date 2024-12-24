resource "aws_vpc" "vpc_main" {
  cidr_block = var.vpc_main_cidr
  tags = {
    Name = "VPC_VIRGINIA",
    env  = "Dev"
  }
}

resource "aws_subnet" "vpc_main_public_subnet" {
  vpc_id                  = aws_vpc.vpc_main.id
  cidr_block              = var.subnets_main_cidr[0]
  map_public_ip_on_launch = true
}

resource "aws_subnet" "vpc_main_private_subnet" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = var.subnets_main_cidr[1]
}
