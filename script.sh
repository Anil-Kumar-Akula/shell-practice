#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "you are root user"
else
    echo "ERROR :: Please use you a root user"
fi

