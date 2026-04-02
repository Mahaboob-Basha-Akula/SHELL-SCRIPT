#!/bin/bash



USER=$(id -u)

if [ $USER -ne 0 ]; then 
    echo "ERROR:: Need root privilages to install packages"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo " $2 installation... FAILED"
    else 
        echo " $2 installation... SUCCESS"
    fi
}



dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "Package already exits...SKIPPING"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE $? "NGINX"
else
    echo "Package already exits...SKIPPING"
fi


