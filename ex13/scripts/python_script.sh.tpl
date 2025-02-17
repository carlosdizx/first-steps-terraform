#!/bin/bash
set -e

sudo apt-get update -y

sudo apt-get install -y git python3 python3-pip

git clone https://github.com/carlosdizx/chatbot-cotransa

cd chatbot-cotransa

export OPEN_AI_API_KEY="${open_ai_api_key}"
export DB_SERVER="${db_server}"
export DB_DATABASE="${db_database}"
export DB_USERNAME="${db_username}"
export DB_PASSWORD="${db_password}"
export DB_PORT="${db_port}"

pip3 install -r requirements.txt

streamlit run main.py

