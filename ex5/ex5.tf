terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
resource "aws_dynamodb_table" "transi-store" {
  name         = "label-enrollment-qa"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "uuid"

  attribute {
    name = "uuid"
    type = "S"
  }

  tags = {
    Name        = "Transactional Store"
    Environment = "dev"
    Company     = "Milio"
  }
}