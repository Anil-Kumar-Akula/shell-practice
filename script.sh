#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "you are not using the root user previleges, please switch to the root user"
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql is installed successfully"
else
    echo "mysql installation failed"
fi

