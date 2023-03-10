#!/bin/bash

# This script installs postgresql-13 on debian 11

sudo apt update

sudo apt install -y curl apt-transport-https

# Debian 11

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql.list

sudo apt update

sudo apt install -y postgresql-13
