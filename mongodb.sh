#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo "ERROR :: RUN AS ROOT USER"
    exit 1
else
    cp mongo.repo /etc/yum.repos.d/mongo.repo
    
    dnf install mongodb-org -y 
    if [$? -eq 0]; then
       echo "mongodb enabling"
       systemctl enable mongod
       
    else 
       echo "mongo db enable failed"

    fi
    systemctl start mongod 
    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
    systemctl restart mongod

fi