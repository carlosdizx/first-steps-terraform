resource "aws_instance" "public_instance" {
  ami                    = "ami-01816d07b1128cd2d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  tags = {
    Name : "Web Server 1"
  }
}