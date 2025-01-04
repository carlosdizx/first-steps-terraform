resource "aws_instance" "instance_base" {
  for_each                    = toset(var.spec_instances)
  ami                         = var.details_instances.ami
  instance_type               = var.details_instances.type
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids      = [aws_security_group.sg_public_instance.id]
  user_data                   = file("scripts/node_script.sh")
  user_data_replace_on_change = true
  tags = {
    Name : each.value
  }
}
