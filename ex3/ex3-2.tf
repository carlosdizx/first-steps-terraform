resource "local_file" "products" {
  count    = 5
  content  = "list clientes for the next weekend"
  filename = "clients-${random_string.suf[count.index].id}.txt"
}