#!/bin/bash

cp mongo.repo  /etc/yum.repos.d/mongo.repo
echo "installing mongodb-org package"

if [ $? -eq 0 ]; then
    echo "mongo.repo file is copied successfully"
else
    echo "ERROR :: mongo.repo file is not copied successfully"
    exit 1
fi
dnf install mongodb-org -y 
echo "mongodb-org package is installed successfully"
systemctl enable mongod 
echo "mongodb service is enabled successfully"
systemctl start mongod 
echo "mongodb service is started successfully"
dnf install sed -y
echo "sed package is installed successfully"
# Replace IP
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
echo "IP address is replaced successfully"
systemctl restart mongod
echo "mongodb service is restarted successfully"
systemctl status mongod
