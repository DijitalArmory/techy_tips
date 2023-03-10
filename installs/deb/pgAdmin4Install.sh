#!/bin/bash

sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

cat /etc/apt/sources.list.d/pgadmin4.list

sudo apt -y update

sudo apt install pgadmin4

sudo apt install pgadmin4-web

sudo /usr/pgadmin4/bin/setup-web.sh

# Access pgAdmin 4 Web interface
# Open your web browser and access pgAdmin 4 dashboard:
 http://[ServerIP_or_domain]/pgadmin4

# Use the set email address and password.

# enter rootdb name (maintanence db) postgres
# enter rootdb (maintanence db) username 
# enter rootdb (maintenence db) password

