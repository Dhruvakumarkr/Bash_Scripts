#!/bin/bash

echo "#####################################################"
date 
# ls /var/run/apache2/apache2.pid &> /dev/null

if [ -f /var/run/apache2/apache2.pid ]
 then
   echo "apache2 process is running."
else
   echo "apache2 process is NOT Running."
   echo "Starting the process"
   systemctl start apache2 
   
if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo

sudo systemctl status apache2
ls /var/www/html/

echo "#####################################################"
echo 

