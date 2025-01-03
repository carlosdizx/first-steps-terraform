resource "aws_instance" "public_instance" {
  ami                    = var.instance_parameters.ami
  instance_type          = var.instance_parameters.type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/ec2_user_data.sh")
  provisioner "local-exec" {
    command = "echo 'Hello from ${aws_instance.public_instance.public_ip}' >> instance_created.txt"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Bye bye from ${self.public_ip}' >> instance_distroyed.txt"
  }

  tags = {
    Name : "Web Server 1"
  }
}