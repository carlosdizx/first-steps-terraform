resource "aws_instance" "public_instance" {
  ami           = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpc_main_public_subnet.id
}