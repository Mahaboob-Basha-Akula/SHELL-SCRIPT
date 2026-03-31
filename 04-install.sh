#!/bin/bash

N="\e[0m"  #clour code for white
R="\e[31m" # colour code for red
G="\e[32m" # colour code for green
Y="\e[33m" # colour code for yellow

USER_ID=$(id -u)

if [ $USER_ID -eq 0 ]; then
    echo -e "$G you have root  privilages for installing packages $N"
else
    echo -e "$R ERROR:: you don't have root privilages for instalinng packages $N"
    exit 1
fi

VALIDATE(){

    if [ $1 -eq 0 ]; then
        echo " Installation of $2 is successful"
    else
        echo " Installation of $2 is failed"
        exit 1
fi

}

dnf list installed mysql
if [ $? -eq 0 ]; then 
    echo -e " $G you already have the package $N, $Y So SKIPPING $N "
else 
    echo -e " $R You don't have mysql so, installing $N "
fi
dnf install mysql -y
VALIDATE $? "MySql"

dnf list installed nginx
if [ $? -eq 0 ]; then 
    echo -e " $G you already have nginx package $N, $Y So SKIPPING $N "
else
    echo -e " $R you don't have nginx so, installing $N "
fi
dnf install nginx -y
VALIDATE $? "nginx"






