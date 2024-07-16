#!/bin/bash

# Variable Declaration
PACKAGE="apache2"
SVC="apache2"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies 
echo "======================================"
echo "Installing packages"
echo "======================================"
sudo apt-get install apache2 -y
echo 

# Start and Enable Service
echo "======================================"
echo "Starting and Enabling apache2 Service"
echo "======================================"
sudo systemctl start apache2
sudo systemctl enable apache2
echo

# Creating Temp Directory
echo "======================================"
echo "Starting Artifact Deployment"
echo "======================================"
sudo mkdir -p /tmp/webfiles
cd /tmp/webfiles

sudo wget $1
unzip $2.zip
sudo cp -r 2098_health/* /var/www/html
echo

# Bounce Service
echo "======================================"
echo "Restarting apache2 service"
echo "======================================"
sudo systemctl restart apache2

# Clean up
echo "======================================"
echo "Cleaning Up"
echo "======================================"
sudo rm -rf $TEMPDIR
echo

# Checkinf status of service
echo "======================================"
echo "apache2 status"
echo "======================================"
sudo systemctl status apache2
ls /var/www/html/
