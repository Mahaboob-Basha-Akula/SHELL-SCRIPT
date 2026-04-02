#!/bin/bash
N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"


USER=$(id -u)

if [ $USER -ne 0 ]; then 
    echo -e "$R ERROR:: Need root privilages to install packages $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e " $2 installation... $R FAILED $N"
    else 
        echo -e " $2 installation... $G SUCCESS $N"
    fi
}



dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e "Package already exits...$Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo -e "Package already exits...$Y SKIPPING $N"
fi


