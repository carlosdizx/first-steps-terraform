resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_VIRGINIA",
    env  = "Dev"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = var.ohio_cidr
  tags = {
    Name = "VPC_OHIO",
    env  = "Dev"
  }
  provider = aws.ohio
}

# This in other file
variable "virginia_cidr" {
  default = "10.10.0.0/16"
}

variable "ohio_cidr" {
  default = "10.20.0.0/16"
}