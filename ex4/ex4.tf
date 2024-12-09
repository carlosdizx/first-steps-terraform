terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
resource "aws_s3_bucket" "providers" {
  count  = 6
  bucket = "ernestodiaz-providers-${random_string.suf[count.index].id}"
  tags = {
    owner  = "Ernesto Diaz"
    name   = "providers-${count.index}"
    office = "thirds"
  }
}

resource "random_string" "suf" {
  count   = 6
  length  = 8
  special = false
  upper   = false
  numeric = false
}