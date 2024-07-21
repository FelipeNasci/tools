#!/bin/bash
## install apps


# Definindo cores
GREEN='\033[0;32m'
NC='\033[0m' # No Color (reset)

echo -e "${GREEN}## Update ##${NC}"
apt update -y 

echo -e "${GREEN}## Upgrade ##${NC}"
apt upgrade -y

echo -e "${GREEN}## Install wget ##${NC}"
apt install wget -y

echo -e "${GREEN}## Install git ##${NC}"
apt install git -y

