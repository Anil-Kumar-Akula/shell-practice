#!/bin/bash
packages=("mysql" "httpd" "nginx")

for package in ${packages[@]}; do
    dnf install $package -y
    if [ $? -eq 0 ]; then
        echo "$package is installed successfully"
    else
        echo "ERROR :: $package installation failed"
        exit 1
    fi
done
