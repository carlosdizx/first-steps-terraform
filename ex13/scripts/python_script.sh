#!/bin/bash
set -e

sudo apt-get update -y

sudo apt-get install -y git python3 python3-pip

git clone https://github.com/carlosdizx/chatbot-cotransa

cd chatbot-cotransa

pip3 install -r requirements.txt

streamlit run main.py

