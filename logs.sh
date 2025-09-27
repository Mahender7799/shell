#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell"
USERID=$(id -u)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOGG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started at : $(date)"
echo "Script started executing at: $date"
if [ $USERID -ne 0 ];then
   echo -e " ERROR::Please run script with root prevelages "
   exit 1
fi

VALIDATE(){ ## Functions receives inputs through args just like shell scripts
    if [ $? -ne 0 ];then
        echo -e " Installing $2 ... is $R FAILED $N"
        exit 1
    else
        echo -e " installing $2 ... is $G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOGG_FILE
#Install if it not found
if [ $? -ne 0 ];then
    dnf install mysql -y &>>$LOGG_FILE
    VALIDATE $? "MYSQL"
else
  echo -e "mysql already exist ... $Y skipping $N"
fi

dnf list installed nginx  &>>$LOGG_FILE
if  [ $? -ne 0 ];then
    dnf install nginx -y &>>$LOGG_FILE
    VALIDATE  $? "NGINX"  
else
  echo -e "Nginx alreday exist ... $Y Skipping $N"
fi

dnf list installed python3 &>>$LOGG_FILE
if [ $? -ne 0 ];then
    dnf install python3 -y &>>$LOGG_FILE
    VALIDATE $? "PYTHON3"
else
  echo -e "python already installed .. $Y Skipping $N"    
fi
