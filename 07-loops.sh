#!/bin/bash

# for i in {1..20}
# do
#     echo $i
# done
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
    echo -e "$R ERROR:: You don't have root privilages, need root privilages $N"
    exit 1
else
    echo -e "$G You have root privilages $N"
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e "$R Installing of $package is failed $N"
    else
        echo " $G Installing of $package is success $N"
    fi
}

for packages in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y  &>> $LOG_FILE
        VALIDATE $? $package
    else
        echo -e "$P $package is already exist... $N $Y SKIPPING $N"
    fi
    
done





