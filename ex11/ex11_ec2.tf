/*
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
*/

resource "aws_instance" "Web_Server" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.myKey.key_name
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    "Name" = "Web Server"
  }
  vpc_security_group_ids      = [aws_security_group.sg_public_instance.id]
  user_data_replace_on_change = true
}