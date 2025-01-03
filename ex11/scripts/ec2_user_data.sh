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
echo 'hello world' > ~/greeting.txt