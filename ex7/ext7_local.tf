resource "aws_vpc" "vpc_virginia" {
  cidr_block = local.virginia_cidr
  tags = {
    Name = "VPC_VIRGINIA",
    env  = "Dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = local.ohio_cidr
  tags = {
    Name = "VPC_OHIO",
    env  = "Dev"
  }
  provider = aws.ohio
}

locals {
  virginia_cidr = "10.10.0.0/16"
  ohio_cidr     = "10.20.0.0/16"
}
