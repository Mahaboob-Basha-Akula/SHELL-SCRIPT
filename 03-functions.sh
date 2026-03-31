#!/bin/bash

USER=$(id -u)

if [ $USER -eq 0 ]; then
    echo "you have root privilagges to install packages"
else
    echo "ERROR:: you don't have root privilages to install packages"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then 
        echo " installaion of $2 is successful"
    else
        echo "installation of $2 is failed"
        exit 1 
    fi

}

dnf install mysql -y
VALIDATE $? "mysql"


dnf install nginx -y 
VALIDATE $? "nginx"






