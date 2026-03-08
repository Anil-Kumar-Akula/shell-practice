# #!/bin/bash
# packages=("mysql" "httpd" "nginx")

# for package in ${packages[@]}; do
#     dnf install $package -y
#     if [ $? -eq 0 ]; then
#         echo "$package is installed successfully"
#     else
#         echo "ERROR :: $package installation failed"
#         exit 1
#     fi
# done


#!/bin/bash

echo "Please Enter the Packages which you want to install"
read PACKAGES

for i in ${PACKAGES[@]};do
    if [ $(id -u) -ne 0 ]; then
     echo "ERROR :: RUN AS ROOT USER"
     exit 1
    fi

    dnf install $i -y
   
    if [ $? -eq 0 ]; then
     echo "$i are installed successful"
    else
     echo "ERROR :: $i are not installed sucessfull"
     exit 1
    fi
done