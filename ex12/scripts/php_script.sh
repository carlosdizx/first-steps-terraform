#!/bin/bash
# Actualiza los paquetes
yum update -y
# Instala Apache y PHP
yum install -y httpd php
# Crea una aplicación simple en PHP
echo "<?php
echo '<h1>Hello World!</h1>';
?>" > /var/www/html/index.php
# Inicia y habilita Apache para que inicie al arrancar
systemctl start httpd
systemctl enable httpd