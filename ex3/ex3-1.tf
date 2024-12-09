resource "random_string" "suf" {
  count   = 5
  length  = 4
  special = false
  upper   = false
  numeric = false
}