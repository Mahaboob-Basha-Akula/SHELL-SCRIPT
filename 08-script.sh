#!/bin/bash
N="\e[0m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
P="\e[35m"

LOG_FOLDER="/var/log/Shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
USER=$(id -u)

mkdir -p $LOG_FOLDER
echo "Script Execution started at $(date)"


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

for softwares in $@
do
        dnf list installed mysql &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $softwares -y &>> $LOG_FILE
        VALIDATE $? "$softwares"
    else
        echo -e "$softwares already exits...$Y SKIPPING $N"
    fi
done


# dnf list installed mysql
# if [ $? -ne 0 ]; then
#     dnf install mysql -y
#     VALIDATE $? "MYSQL"
# else
#     echo -e "Package already exits...$Y SKIPPING $N"
# fi

# dnf list installed nginx
# if [ $? -ne 0 ]; then 
#     dnf install nginx -y
#     VALIDATE $? "NGINX"
# else
#     echo -e "Package already exits...$Y SKIPPING $N"
# fi


