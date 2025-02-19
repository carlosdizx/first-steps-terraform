#!/bin/bash
#Instalación y actualización de los paquetes e instancia
apt update
apt install -y python3-pip git python3-virtualenv

# Creación de entorno virtual
virtualenv venv --python=python3
source venv/bin/activate

# Clonación del repositorio
git clone https://github.com/carlosdizx/chatbot-cotransa chatbot
cd /chatbot || exit

# Creación de las variables de entorno
cat <<EOF > .env
OPEN_AI_API_KEY=sk....
DB_SERVER=...
DB_DATABASE=...
DB_USERNAME=...
DB_PASSWORD=...
DB_PORT=...
EOF

# Instalación de las dependencias y ejecución de la app
pip install -r requirements.txt
nohup streamlit run main.py &
