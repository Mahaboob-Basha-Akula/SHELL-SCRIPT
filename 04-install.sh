#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -eq 0 ]; then
    echo "you have root  privilages for installing packages"
else
    echo "ERROR:: you don't have root privilages for instalinng packages"
    exit 1
fi

VALIDATE(){

    if [ $1 -eq 0 ]; then
        echo "Installation of $2 is successful"
    else
        echo "Installation of $2 is failed"
        exit 1
fi

}

dnf list installed mysql
if [ $? -eq 0 ]; then 
    echo "you already have the package"
else 
    echo "You don't have mysql so, installing"
fi
dnf install mysql -y
VALIDATE $? "MySql"

dnf list installed nginx
if [ $? -eq 0 ]; then 
    echo "you already have nginx package"
else
    echo "you don't have nginx so, installing"
dnf install nginx -y
VALIDATE $? "nginx"






