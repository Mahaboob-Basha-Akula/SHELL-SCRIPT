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
        echo -e " e[32mInstallation of $2 is successful"
    else
        echo -e " e[31mInstallation of $2 is failed"
        exit 1
fi

}

dnf list installed mysql
if [ $? -eq 0 ]; then 
    echo -e " \e[32m you already have the package "
else 
    echo -e " \e[31m You don't have mysql so, installing "
fi
dnf install mysql -y
VALIDATE $? "MySql"

dnf list installed nginx
if [ $? -eq 0 ]; then 
    echo -e " \e[32m you already have nginx package "
else
    echo -e " \e[31m you don't have nginx so, installing "
fi
dnf install nginx -y
VALIDATE $? "nginx"






