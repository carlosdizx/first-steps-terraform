resource "tls_private_key" "keys" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.keys.private_key_pem
  filename = "${path.module}/private_key.pem"
}

resource "local_file" "public_key_file" {
  content  = tls_private_key.keys.public_key_openssh
  filename = "${path.module}/public_key.pub"
}

output "private_key_path" {
  value = local_file.private_key_file.filename
}

output "public_key_path" {
  value = local_file.public_key_file.filename
}
