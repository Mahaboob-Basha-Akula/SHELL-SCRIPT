#!/bin/bash 
#it is a shebang ,acts as a interpreter in shell script, it will be used to execute the script and checks the syntax
N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"

USER=$(id -u)
LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo "Script execution started at $(date)"

if [ $USER -ne 0 ]; then 
    echo -e "$R ERROR::You don't have root privilages to install the packages $N"
    exit 1
else
    echo -e " $G You have root privilages for this user $N"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Installaion of package $2 is failed"
    else
        echo "Installation of package $2 is success"
    fi
}


dnf list installed mysql &>> $LOG_FILE
# if [ $? -eq 0 ]; then 
#     echo "Package already installed"
# else
#     echo "Installing the package"
# fi
if [ $? -ne 0 ]; then 
    echo -e "$G Installing the package $N"
else
    echo -e "$P package already exits... $N $Y SKIPPING $N"
    exit 1
fi
dnf  install mysql -y &>> $LOG_FILE
VALIDATE $? "MYSQL"

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ]; then 
    echo -e "$G Installing package $N"
else
    echo -e "$P Package already exits... $N $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
    echo -e "$G Installing Package $N"
else
    echo "$P Package already exits...$N $Y SKIPPING $N"

dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "NGINX"



