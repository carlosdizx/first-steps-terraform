resource "aws_instance" "public_instance" {
  ami                    = var.instance_parameters.ami
  instance_type          = var.instance_parameters.type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  #user_data = file("scripts/ec2_user_data.sh")
  user_data = <<-EOF
    #!/bin/bash
    # Actualiza los paquetes
    yum update -y
    # Instala Node.js
    curl -sL https://rpm.nodesource.com/setup_16.x | bash -
    yum install -y nodejs
    # Crea una aplicación simple en Node.js
    # shellcheck disable=SC2028
    echo "const http = require('http');
    const server = http.createServer((req, res) => {
      res.statusCode = 200;
      res.setHeader('Content-Type', 'text/plain');
      res.end('Hello World\\n');
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