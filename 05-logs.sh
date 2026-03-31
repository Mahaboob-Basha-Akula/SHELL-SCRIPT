#!/bin/bash
N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"



LOG_FOLDER="/var/log/shell_script"
SCRIPT_NAME=$( echo  $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

USER_ID=$(id -u)

mkdir -p $LOG_FOLDER
# when we run this commands multiple times, it will show error like file already exists, so using -p 
# -p is check the file if file present, it will not create ,if not it will create

echo "Script execution starts at: $(date)"

if [ $USER_ID -eq 0 ]; then 
    echo -e " $G You have root privilages $N"
else
    echo -e " $R ERROR:: Need root privilages to install the packages $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then 
        echo "Package $2 installation is success"
    else
        echo "Package $2 installation is failed"
        exit 1
    fi

}


dnf list installed mysql &>>LOG_FILE
if [ $? -eq 0 ]; then 
    echo -e " $G Package already installed... $N $Y SKIPPING $N"
else
    echo -e " $Y Installing the package $N"
fi
dnf install mysql -y &>>LOG_FILE
VALIDATE $? "MYSQL"


dnf list installed nginx &>>LOG_FILE
if [ $? -eq 0 ]; then
    echo -e " $G package alaready installed... $N $Y SKIPPING $N"
else
    echo -e "$Y Installing package $N"
fi
dnf install nginx -y &>>LOG_FILE
VALIDATE $? "NGINX"

