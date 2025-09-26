#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "error:please run the script with root user"
    exit 1  ## failure is other than 0
fi

VALIDATE(){ ## functions receives input through args like shell scripts args
    if [ $1 -ne 0 ]; then
     echo "error::installing $2 is failed"
     exit 1 
    else
       echo "installing $2 is success"     

    fi 
}

dnf install mysql -y
VALIDATE $? "Mysql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python"


