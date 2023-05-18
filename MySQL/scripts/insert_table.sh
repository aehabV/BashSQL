#!/bin/bash
ls DataBases
read -p "Enter the database name: " dbname
if [[ $(find DataBases -type d -name $dbname | wc -l) -eq 1 ]]
then
if [[ $(cat DataBases/$dbname/owner.txt) == $uname ]]
then
if [[ $(ls DataBases/$dbname/ | wc -l) -ge 2 ]]
then
find DataBases/$dbname -name "*.table" | cut -d/ -f3 | cut -d. -f1
read -p "Enter table name: " tabname
if [[  $(find DataBases/$dbname -type f -name ${tabname}.table | wc -l) -eq 1 ]]
then
head -1 DataBases/$dbname/${tabname}.table | sed 's/,/ \t/g'
recNum=0
insertMore="y"
while [[ $insertMore == "y" ]]
do
read -p "Enter columns values seperated by comma: " colValues
headerNum=$(head -1 DataBases/$dbname/${tabname}.table | sed 's/,/\t/g' | wc -w)
entriesNum=$(echo $colValues | sed 's/,/ /g' | wc -w)
if [[ $headerNum -eq $entriesNum ]]
then
fcol=$( echo $colValues | cut -d, -f1)
if [[ $(grep -w $fcol DataBases/$dbname/${tabname}.table | wc -l) -eq 1 ]]
then
echo "Cannot insert $fcol - primary key violated."
else
echo $colValues >>  DataBases/$dbname/${tabname}.table
recNum=$((recNum+1))
echo "Record has been inserted successfully."
read -p "Insert one more record [y/n]: " insertMore
fi
else
echo "ERROR: Expected $headerNum values, got $entriesNum."
fi
done
if [[ $recNum -gt 1 ]]
then
echo "$recNum records have been inserted successfully."
fi
else
echo "Table does not exist."
fi
else
echo "There are no tables in $dbname."
fi
else
echo "You are not logged in as the database owner."
fi
else
echo "Database does not exist."
fi
