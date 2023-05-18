#!/bin/bash
read -p "Enter the username you want to remove: " user
if [[ $user != "oracle" ]]
then
if [[ $(cat  ../DB_admins.db | grep -w $user | wc -l) -eq 1 ]]
then
sed -in "/^$user$/d" ../DB_admins.db
echo "$user's account has been successfully deleted. Goodbye!"
else
echo "User does not exist."
fi
else
echo "Can't delete user oracle."
fi
