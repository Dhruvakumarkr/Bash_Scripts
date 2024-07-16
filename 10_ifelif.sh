#!/bin/bash

#value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)
echo "Enter a Number:"
read value
echo

if [ $value -eq 1 ]
then
  echo "1 Active Network Interface found."
elif [ $value -gt 1 ]
then
  echo "Found $value Multiple active Interface."
else
  echo "No Active interface found."
fi



