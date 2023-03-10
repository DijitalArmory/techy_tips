#!/bin/bash 

sudo apt -y update && sudo apt -y upgrade
sudo apt install curl apt-transport-https gnupg2 -y
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt -y update
sudo apt install powershell -y

# pwsh command to enter PS env
