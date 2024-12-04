terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}
resource "local_file" "products" {
  content  = "list products for the next weekend"
  filename = "products.txt"
}