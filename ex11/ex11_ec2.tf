resource "aws_instance" "public_instance" {
  ami                    = "ami-01816d07b1128cd2d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = <<-EOF
    #!/bin/bash
    # Actualiza los paquetes
    yum update -y
    # Instala Node.js
    curl -sL https://rpm.nodesource.com/setup_16.x | bash -
    yum install -y nodejs
    # Crea una aplicación simple en Node.js
    echo "const http = require('http');
    const server = http.createServer((req, res) => {
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/html');
      res.end('<h1>Hello world!!</h1>');
    });
    server.listen(80, () => {
      console.log('Server running on port 80');
    });" > /home/ec2-user/app.js
    # Ejecuta la aplicación al iniciar la máquina
    nohup node /home/ec2-user/app.js &
  EOF
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