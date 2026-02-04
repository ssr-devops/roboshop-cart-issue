#!/bin/bash

source ./common.sh
app_name=mysql

check_root

dnf install mysql-server -y &>>$LOGS_FILE
VALIDATE $? "Install MySQL server"

systemctl enable mysqld &>>$LOGS_FILE
systemctl start mysqld  
VALIDATE $? "Enable and start mysql"

# get the password from user
mysql_secure_installation --set-root-pass RoboShop@1
VALIDATE $? "Setup root password"

