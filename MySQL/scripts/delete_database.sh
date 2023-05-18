#!/bin/bash
ls DataBases
read -p "Enter the database you want to remove: " dbname
if [[ $(find DataBases -type d -name $dbname | wc -l) -eq 1 ]]
then
if [[ $(cat DataBases/$dbname/owner.txt) == $uname ]]
then
rm -rf  DataBases/$dbname
echo "$dbname has been successfully deleted."
else
echo "You are not logged in as the database owner." 
fi
else
echo "Database does not exist."
fi
