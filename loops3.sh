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
   echo -e " ERROR::Please run script with root prevelages " | tee -a $LOGG_FILE
   exit 1
fi

VALIDATE(){ ## Functions receives inputs through args just like shell scripts
    if [ $? -ne 0 ];then
        echo -e " Installing $2 ... is $R FAILED $N" | tee -a $LOGG_FILE
        exit 1
    else
        echo -e " installing $2 ... is $G SUCCESS $N" | tee -a $LOGG_FILE
    fi
}

## $@

for package in $@
do
##check if package is already installed or not
   dnf list installed $package &>>$LOG_FILE
   if [$? -ne 0]; then
	    dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
	else
      echo -e "$package is already installed ... $Y SKIPPING$N "
    fi	 
done     