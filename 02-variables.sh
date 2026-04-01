#!/bin/bash
PERSON1=$1
PERSON2=$2

echo "${PERSON1}:: What is shell script"
echo "${PERSON2} :: Shell script is a text file containig list of commands which are in linux/unix.it is used for automation for repetative tasks"
echo "${PERSON1}:: What is git branching strategy"
echo "${PERSON2}:: In git we have one master branch i.e main branch when developers wants to develop new feature they will not directly use main branch for developing, so they will copy the main branch into one feature branch and do the development in that branch and test after completion they will raise PR and merge to main branch"
 #when we use $1, $2 understood we are passing our arguments in the command line while executing the script
 #Ex: sh 02-variables.sh BASHA SIVA here Script takes BASHA in $1 and SIVA in $2
 # So, our main goals is to make the script with less edits and more efficient



# ENV VARIABLES

 echo "Enter password"
 read -s "PASSWORD" # here password is variable
 echo "Password is ${PASSWORD}"

 #When we enter a password it will not shown when we use -s and in the next command it will print.Actually in real time not recommanded to print the secrts


echo "${DEVOPS}"
 # In linux everyting is a process, when we create a server in AWS,after login that is also a process, inside the server we have shell script so we can call that is also a process
 # in command line use export DEVOPS=USE_SHELL_SCRIPT
 # when we use the above ENV variable, it will only alive upto the ps in live if we restart or relogin so process will kill right so the above ENV varible so kill

 # If u want to use the ENV even after session completed, add the ENV variable in home location for that use ls -la, u will see .bashrc file, in that add the ENV variable before the last line of the file like "exprot DEVOPS=Learing_Shell_script"
 # after adding the ENV varible use "source .bashrc" it means we need to update the changes in that file 
 # priority is .bashrc file





# HOW DO YOU RUN A COMMAND INSIDE THE SHELL SCRIPT

#if we want to set the date in sciprt use "date +%Y-%m-%d" , date +%s  it will show total time in seconds
# if we want info use date --help

START_TIME=$(date +%s)  # in the command the current time in seconds will be stored in START_TIME varible
echo "Start time is ${START_TIME}"  # it will print the Start time in seconds
sleep 20     # script sleep in 20 second and if u want to run the script in backgorund use "sleep 10 &"
END_TIME=$(date +%s)  # in the command the current time in seconds will be stored in END_TIME varible
TOTAL_TIME=$((END_TIME-START_TIME)) # here the total time will calculate and stored in TOTAL_TIME variable
#how much time taken to execute the above script
echo "Time taken is: ${TOTAL_TIME}"  # prints the total time 

# why we use this ex here is to understand how the commands in execute script and how the output stored in varibles.

# As of now we learn 1. We declared the variable inside the script like "START_TIME=$(date +%s)"
                    #2.we passed the values as arguments like PERSON1="BASHA", PERSON2="SIVA"
                    #3.used the read command like "read -s "PASSWORD""
                    #4.ENV variables like "export DEVOPS=Learn_shell_script" , and line .bashrc file"
                    #5.dynamic execution in command line like "sh varible.sh BASHA SIVA"
#AND we have some default varibles that will be given by shell script like use "$@ for all, $* for all"     
echo "All varibes given by shell script $@" 
echo "All varaibles are $*"
echo "script name is $0" # it will give the script name
echo "current directory $PWD"
echo "Current user $USER"
echo "Home directory of user $HOME"  
echo "PID of this script $$"
sleep 10 &
echo "PID of the last command in background $!"
#These are special variables            
# This are the topics related to VARIABLES


#In any programing language we have variables, data_types, Conditions, Functions, Loops, Error landling



#DATA_TYPES

#what is date types:: In the name itself explains which type of our given data is like "BASHA" it is a name so it is string "1" it is number "true/false" is a boolean
#integers from -33768 to 33768
# Strings --> names 
# Boolean --> true/false
#Char --> a,d,c,d
#float --> 33.32
#decimal--> 33.67876
#long-->8317502955

#why we are using is for easy representations

# There are no explicite data types in Shell script.It will automatically understands the type of data we are using.Everything in script is string only
# Syntax for execution of command in script is "$(command)" and "$(command) for math operations"

# Array = ("linux" "shell" "Devops") ----> list of something

Tools=("Devops" "shell_script" "Docker" "Kubernetes") #size of this array is 4, max index=3
echo "All tools are ${Tools}[$@]"

# Here if we want perticualr tool, we have option called Index so in programming index will start from 0,if u want frist tool from array use like
echo "Frist tools is ${Tools}[0]"
echo "Second tools is ${Tools}[1]"
echo "Tool is ${Tools}[5]"  # here max size is 4 only but I have given index 5 it means it needs to show 6th tool from array but we don't have that so it will show nothing
#






 

 #CONDITIONS::

 #conditions are statements like we are telling to shell script use this condition when the given expression true otherwise use other statement when expression false

# if(condition) {
#     this statement will executes when the expression true
#  }                                                                     # This is basic programming language
# else {
#     this statement will executes when the expression false
# }


# if[condition];
#  this commands will executes when the condition true

# else                                                  
#  this commands will run when the conditions false

# fi 

# if starts the execution and fi ends the execution


#Example::
NUMBER=$1

if[ $NUMBER -lt 10 ]; then
    echo "Given number ${"NUMBER"} less than 10"

else
    echo "Given number ${"NUMBER"} greater than 10"

fi

NUMBER1=$2

if[ $NUMBER1 -gt 20 ]; then 
    echo "Given number ${"NUMBER1"} is greater than 20"

else 
    echo "Given number ${"NUMBER1"} is less than 20"

fi


NUMBER=$3

if[ $NUMBER -ne 30 ]; then
    echo "Given number ${"NUMBER"} is not equal to 30"

elif[$NUMBER -eq 30 ]; then
    echo "Given number ${"NUMBER"} is equal to 30"
else
    echo "Given number $NUMBER  is greater than 30"

fi



echo "Enter the number"
read NUMBER

if[$(($NUMBER % 2)) -eq 0 ]; then 
    echo "Given number ${"NUMBER"} is even number "

else
    echo "Given number ${"NUMBER"} is odd number "

fi 




#EXIT CODES in SHELL-SCRIPT::

#Programming language and Shell scripts only understood numbers.like binaries 0 and 1.
# In shell script, the previous commands exit codes will be stored in special variable "$?"
# $?=0 it is success
# $? = 1 to 127 it is failure 
# why we are using is, when the script was failed at some steps, the execution needs to stops at that step only, and intimate us about that failure.

#Example script::

# USERID=$(id -u)
# if [$USERID -ne 0 ]; then
#     echo "ERROR:: we don't have root privilages, need root access for installing "
# fi

# dnf update
# echo "$?"
# if[ $? -eq 1 ]; then
#     dnf install mysql -y
#     echo "mysql --version"
#     echo "mysql installed successfully"
# else
#     echo "mysql was not installed" 

# fi

USER_ID=$(id -u)
 
if [ USER_ID -ne 0 ]; then 
    echo "we have root access"
else 
    echo "ERROR:: you don't have root privilages to install the package"
    exit 1 # it will exit when it fails
fi

# from the above function we will get error beacause id -u is 1001 that is not qual to zero right; so it need root access, so the next commands also fail
# update and install commands also run but it gives error like need root privilages,but in general when we see any error in scripts,we need to steps the next steps
#

dnf update
if [ $? -eq 0 ]; then
    echo "update success"
else
    echo "update failed"
    exit 1
fi


dnf install mysql -y 
if [ $? -eq 0 ]; then
    echo "Mysql is installed successfully"
else
    echo "ERROR:: mysql is not installed"
    exit 1
fi






#EXAMPLE2::

VALIDATE(){ # functions receives input through args like $1 
    if [ $1 -eq 0 ]; then 
        echo "Update of $2 successful"
    else
        echo "Update of $2 failed"
        exit 1
    fi

}

USER_ID=$(id -u)

if [ $USER_ID -eq 0 ]; then
    echo "We have root privilages"
else
    echo "ERROR:: you don't have root privilages, need privilages to install packages."
    exit 1
fi


dnf update -y
VALIDATE $? "update"

# if [ $? -eq 0 ]; then 
#     echo "Update successful"
# else
#     echo "Update failed"
#     exit 1
# fi

dnf install nginx -y 
VALIDATE $? "nginx"
# if [ $? -eq 0 ]; then 
#     echo "Nginx installed successfully"

# else 
#     echo "Nginx installation failed"
#     exit 1

# fi

dnf install mongodb-mongosh
VALIDATE $? "mongodb"

# if [ $? -eq 0 ]; then
#     echo "Mongodb istalled successfully"
    
# else 
#     echo "Mongodb installaion failed"
#     exit 1
# fi


#scripting goals are 1. keep less code   2. Readbility must be easy    3. DRY, try to resue the code

# Here we can resue the functions 
# FUNCTIONS----> takes some input and gives the outpu
    # call the function
    # provide input if required
# function will not executes automatically, until we call the function

# SYNTAX 

# fucntion_name(){

# }

#now we can name  our repetative code as a fucntion name as Validate. See above Generall we can add our function on top 





#When we installed some packages already so for that we need to check whether it is installed or not by 
#dnf list installed package_name


#COLOURS FOR SCRIPT::

#RED--> "\e[31m"
#GREEN--> "\e[32m"
#YELLOW--> "\e[33m"
#PINK --> "\e[35m"
#use command like echo -e "\e[31m Hello world"   # here -e --> we are telling to echo to enable this colour code after \
# we need to use "\e[0m"--> white colour to end the colour like upto what extend we nned to use, at that end use \e[0m"
#This colour codes will not work in functions.



#LOGS::
# when we do some oprations, we need that logs right for what ww have done preiously, so everytime we run the script that logs store in one file.
# generally logs file is \var\logs so we can create one file with our script name like \var\logs\shell_Script\04-install.log ---> here shell_Script is a directoty and 04-installl.log is a file name
#
# So,for that 




#REDIRECTIONS::
#redirections are used to store the outputs in other files like ls -l > output.log   not showing on display
# $1 for success
# $2 for failure
# $2 for both success and failure
# when we use "command 1> output.log" if the script run successfully it will store the logs in file, if fails shows on display not store in file when we use 1 before the >
# when we use "command 2> output.log" if the script fails then only logs will store in file, if it success, logs will not store in a file.
# but we don't know when command run give success or failure, in that case use "command &> output.log"  here both success and failure logs will store in file
# ">" will replace the logs with new one
# But we need all logs so need to use ">>"































