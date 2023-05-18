#!/bin/bash
ls DataBases
read -p "Enter the database name: " dbname
if [[ $(find DataBases -type d -name $dbname | wc -l) -eq 1 ]]
then
if [[ $(cat DataBases/$dbname/owner.txt) == $uname ]]
then
read -p "Enter table name: " tabname
if [[ $(find DataBases/$dbname -type f -name ${tabname}.table | wc -l) -eq 0 ]]
then
read -p "Enter columns names seperated by space (eg. EMP_ID EMP_SSN): " colNames
echo $colNames | sed  's/ /,/g' >> DataBases/$dbname/$tabname.table
echo "$tabname has been created successfully."
else
echo "$tabname already exists."
fi
else
echo "You are not logged in as the database owner." 
fi
else
echo "Database does not exist."
fi
