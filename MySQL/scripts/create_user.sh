#!/bin/bash
read -p "Enter username: " user
if [[ $(cat  ../DB_admins.db | grep -w $user | wc -l) -eq 1 ]]
then
echo "User already exists."
else
echo $user >> ../DB_admins.db
echo "User $user has been created successfully."
fi
