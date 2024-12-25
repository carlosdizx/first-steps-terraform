resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key" {
  content  = tls_private_key.key_pair.private_key_pem
  filename = "${path.module}/ec2_key.pem"
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = tls_private_key.key_pair.public_key_openssh
}

output "private_key_path" {
  value = local_file.private_key.filename
}