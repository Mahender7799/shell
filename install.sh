#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
   echo "Error::Please run this script with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0 ];then
   echo "Error: Installing MYSQL is failed"
else
   echo "Installing MYSQL is success"
fi   


