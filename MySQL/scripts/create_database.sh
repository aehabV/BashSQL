#!/bin/bash
read -p "Enter database name: " dbname
if [[ $(find DataBases -type d -name ${dbname}DB | wc -l) -eq 1 ]]
then
echo "$dbname already exists."
else
mkdir DataBases/${dbname}DB
echo "$dbname has been created successfully."
echo $uname >> DataBases/${dbname}DB/owner.txt
fi
