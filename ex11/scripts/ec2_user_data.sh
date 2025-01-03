#!/bin/bash
# Actualiza los paquetes
yum update -y
# Instala Node.js
curl -sL https://rpm.nodesource.com/setup_22.x | bash -
yum install -y nodejs
# Crea una aplicación simple en Node.js
# shellcheck disable=SC2028
echo "const http = require('http');
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html');
  res.end('<h1>Hello world!</h1>');
});
server.listen(80, () => {
  console.log('Server running on port 80');
});" > /home/ec2-user/app.js
# Ejecuta la aplicación al iniciar la máquina
nohup node /home/ec2-user/app.js &