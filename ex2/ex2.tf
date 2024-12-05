resource "random_string" "suf" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

resource "local_file" "products" {
  content  = "list clientes for the next weekend"
  filename = "clients-${random_string.suf.id}.txt"
}