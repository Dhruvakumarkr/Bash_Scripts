#!/bin/bash

# Variable Declaration
PACKAGE="apache2"
SVC="apache2"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies 
echo "======================================"
echo "Installing packages"
echo "======================================"
sudo apt-get install $PACKAGE -y
echo 

# Start and Enable Service
echo "======================================"
echo "Starting and Enabling apache2 Service"
echo "======================================"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "======================================"
echo "Starting Artifact Deployment"
echo "======================================"
sudo mkdir -p $TEMPDIR
cd $TEMPDIR

sudo wget $URL
unzip $ART_NAME.zip
sudo cp -r $ART_NAME/* /var/www/html
echo

# Bounce Service
echo "======================================"
echo "Restarting apache2 service"
echo "======================================"
sudo systemctl restart $SVC

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
sudo systemctl status $SVC
ls /var/www/html/
