#!/bin/bash

USERID=$(id -u)



if [ $USERID -ne 0 ];then
   echo "ERROR::Please run script with root prevelages"
   exit 1
fi

VALIDATE(){ ## Functions receives inputs through args just like shell scripts
    if [ $? -ne 0 ];then
        echo "ERROR: Installing $2 is FAILED "
        exit 1
    else
        echo "installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"


dnf install nginx -y

VALIDATE  $? "NGINX"     

dnf install mongodb-mongosh -y

VALIDATE $? "MONGOSH"
