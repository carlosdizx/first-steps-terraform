terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.82.2"
    }
  }
  required_version = "~>1.10.1"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}