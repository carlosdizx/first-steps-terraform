#!/bin/bash
# Actualiza los paquetes
yum update -y
# Instala Python 3 y pip
yum install -y python3
# Crea una aplicación simple en Python (servidor HTTP)
echo "from http.server import BaseHTTPRequestHandler, HTTPServer
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b'<h1>Hello World from Python!</h1>')

server_address = ('', 80)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
print('Server running on port 80...')
httpd.serve_forever()" > /home/ec2-user/app.py
# Ejecuta la aplicación al iniciar la máquina
nohup python3 /home/ec2-user/app.py &
