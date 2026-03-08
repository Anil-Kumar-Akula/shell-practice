# #!/bin/bash

# USERID=$(id -u)

# if [ $USERID -ne 0 ]; then
#     echo "ERROR :: you are not using the root user previleges, please switch to the root user"
#     exit 1 # becasue 1 is the failure and 0 is success
# fi

# dnf install mysql -y

# if [ $? -eq 0 ]; then
#     echo "mysql is installed successfully"
# else
#     echo "ERROR :: mysql installation failed"
#     exit 1 # failure is otherthan 0
# fi

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
