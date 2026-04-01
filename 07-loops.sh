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
fi

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo -e "$R Installing of $packages is failed $N"
        exit 1
    else
        echo "$G Installing of $packages is success $N"
    fi
}

for packages in $@
do
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $packages -y  &>> $LOG_FILE
        VALIDATE $? $packages
    else
        echo -e "$P $packages is already exist... $N $Y SKIPPING $N"
    fi
    
done





