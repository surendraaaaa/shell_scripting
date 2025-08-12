#!bin/bash

# this is script for adding user in the LINUX

read -p "please enter the user name : " username

echo "you added user with the name $username"

sudo useradd -m $username

echo "user added successfully!"
