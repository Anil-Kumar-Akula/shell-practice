#!/bin/bash

echo "========== MongoDB Setup =========="

# Check if MongoDB already installed
rpm -q mongodb-org >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB already installed. Skipping installation."
else
    echo "MongoDB not installed. Creating repository..."

    cat <<EOF > /etc/yum.repos.d/mongodb-org-7.0.repo
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/7.0/x86_64/
enabled=1
gpgcheck=0
EOF

    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to create MongoDB repo file"
        exit 1
    fi

    echo "Repository created successfully"

    echo "Refreshing repository cache..."
    dnf clean all
    dnf makecache

    echo "Checking repository..."

    dnf repolist | grep mongodb-org >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "ERROR: MongoDB repository not detected"
        exit 1
    fi

    echo "Installing MongoDB..."

    dnf install mongodb-org -y

    if [ $? -eq 0 ]; then
        echo "MongoDB installed successfully"
    else
        echo "ERROR: MongoDB installation failed"
        exit 1
    fi
fi

echo "Enabling MongoDB service..."

systemctl enable mongod

echo "Starting MongoDB service..."

systemctl start mongod

# Check config file
if [ -f /etc/mongod.conf ]; then
    echo "Updating bind IP..."

    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

    echo "Restarting MongoDB..."
    systemctl restart mongod
else
    echo "ERROR: mongod.conf file not found"
    exit 1
fi

echo "MongoDB setup completed successfully"

systemctl status mongod --no-pager