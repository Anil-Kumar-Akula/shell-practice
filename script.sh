#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR :: you are not using the root user previleges, please switch to the root user"
    exit 1 # becasue 1 is the failure and 0 is success
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql is installed successfully"
else
    echo "ERROR :: mysql installation failed"
    exit 1 # failure is otherthan 0
fi

