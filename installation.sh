#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "error:please run the script with root user"
    exit 1  ## failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
     echo "error::installing mysql is failed"
     exit 1 
else
   echo "installing mysql is success"     

fi   