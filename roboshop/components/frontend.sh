#!/bin/bash
source components/common.sh

Print "Installing Nginx"
yum install nginx -y &>>$LOG
Stat $?

Print "Enabling Nginx"
systemctl enable nginx &>>$LOG
Stat $?

Print "Starting Nginx"
systemctl start nginx &>>$LOG
Stat $?

Print "Download Html Page"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
Stat $?

Print "Remove Old Html Pages"
rm -rf /usr/share/nginx/html/*
Stat $?

#rm -rf *
#unzip /tmp/frontend.zip
#mv frontend-main/* .
#mv static/* .
#rm -rf frontend-master static README.md
#mv localhost.conf /etc/nginx/default.d/roboshop.conf
#systemctl restart nginx