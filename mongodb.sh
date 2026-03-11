#!/bin/bash

echo "===== MongoDB Setup ====="

# Check if MongoDB already installed
rpm -q mongodb-org >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "MongoDB already installed. Skipping installation."
else
    echo "MongoDB not installed. Copying repo file..."

    cp mongo.repo /etc/yum.repos.d/

    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to copy mongo.repo"
        exit 1
    fi

    echo "Cleaning and refreshing repositories..."
    dnf clean all
    dnf makecache

    echo "Checking if MongoDB repo is available..."

    dnf repolist | grep mongodb-org >/dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "ERROR: MongoDB repository not detected"
        echo "Check mongo.repo file"
        exit 1
    fi

    echo "Installing MongoDB..."
    dnf install mongodb-org -y

    if [ $? -ne 0 ]; then
        echo "ERROR: MongoDB installation failed"
        exit 1
    fi

    echo "MongoDB installed successfully"
fi

echo "Enabling MongoDB service..."
systemctl enable mongod

echo "Starting MongoDB service..."
systemctl start mongod

if [ ! -f /etc/mongod.conf ]; then
    echo "ERROR: mongod.conf not found"
    exit 1
fi

echo "Updating bind IP..."
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

echo "Restarting MongoDB..."
systemctl restart mongod

echo "MongoDB setup completed successfully"
systemctl status mongod --no-pager