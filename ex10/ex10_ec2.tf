resource "aws_instance" "node-web-server" {
  ami             = "ami-01816d07b1128cd2d"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.deployer_key.key_name
  security_groups = [aws_security_group.allow_ssh_http.name]

  tags = {
    Name = "Node Web Server"
  }

  user_data = <<-EOF
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
      res.setHeader('Content-Type', 'text/plain');
      res.end('Hello World\\n');
    });
    server.listen(80, () => {
      console.log('Server running on port 80');
    });" > /home/ec2-user/app.js
    # Ejecuta la aplicación al iniciar la máquina
    nohup node /home/ec2-user/app.js &
  EOF
}

output "instance_public_ip" {
  value = aws_instance.node-web-server.public_ip
}

