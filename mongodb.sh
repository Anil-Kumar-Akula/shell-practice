#!/bin/bash

echo "Checking MongoDB installation..."

# Check if mongodb-org package is installed
rpm -q mongodb-org >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB is already installed successfully. Skipping installation."
else
    echo "MongoDB not found. Installing MongoDB..."

    # Copy repo file
    cp mongo.repo /etc/yum.repos.d/

    if [ $? -ne 0 ]; then
        echo "ERROR: mongo.repo file copy failed"
        exit 1
    fi

    echo "Refreshing repository cache..."
    dnf clean all
    dnf makecache

    # Install MongoDB
    dnf install mongodb-org -y

    if [ $? -eq 0 ]; then
        echo "MongoDB installed successfully"
    else
        echo "ERROR: MongoDB installation failed"
        exit 1
    fi
fi

echo "Enabling MongoDB service..."

systemctl enable mongod >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB service enabled successfully"
else
    echo "ERROR: Failed to enable MongoDB service"
    exit 1
fi

echo "Starting MongoDB service..."

systemctl start mongod >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB service started successfully"
else
    echo "ERROR: Failed to start MongoDB service"
    exit 1
fi


# Check if configuration file exists
if [ -f /etc/mongod.conf ]; then
    echo "Updating bind IP address..."

    sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

    if [ $? -eq 0 ]; then
        echo "IP address updated successfully"
    else
        echo "ERROR: Failed to update IP address"
        exit 1
    fi
else
    echo "ERROR: mongod.conf file not found"
    exit 1
fi


echo "Restarting MongoDB service..."

systemctl restart mongod

if [ $? -eq 0 ]; then
    echo "MongoDB restarted successfully"
else
    echo "ERROR: MongoDB restart failed"
    exit 1
fi

echo "MongoDB setup completed successfully"