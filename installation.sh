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

echo "please enter the install packages"
read PACKAGES


if [ $(id -u) -ne 0 ]; then

 echo "ERROR :: Please use the root user privilege"

fi

for i in ${PACKAGES[@]}; do
  
  dnf list installed "$i"* &
  if [ $? -eq 0 ]; then
    echo "$i already installed in the system"
    
  else
        dnf install $i -y

        if [ $? -eq 0 ]; then
        
          echo "$i installed successfully"
        
        else
        
          echo "ERROR :: $i installation failed"
        fi
  fi
done
    