resource "aws_instance" "public_instance" {
  ami                    = var.instance_parameters.ami
  instance_type          = var.instance_parameters.type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.myKey.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = <<-EOF
    #!/bin/bash
    # Actualiza los paquetes
    yum update -y
    # Instala curl y nvm (Node Version Manager)
    yum install -y curl
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh" # Carga nvm
    [ -s "$NVM_DIR/bash_completion" ] && \\. "$NVM_DIR/bash_completion" # Carga autocompletado
    # Instala la última versión de Node.js
    nvm install --lts
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
    echo 'hello world' > ~/greeting.txt
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