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
cat DataBases/$dbname/${tabname}.table
oldRowsCount=$(cat DataBases/$dbname/${tabname}.table | wc -l)
read -p "Enter the string: " str
sed -i "/\<$str\>/d" DataBases/$dbname/${tabname}.table
newRowsCount=$(cat DataBases/$dbname/${tabname}.table | wc -l)
diff=$((oldRowsCount-newRowsCount))
if [[ $diff -gt 1 ]]
then
echo -e  "\n$diff records were successfully deleted.\n"
cat DataBases/$dbname/${tabname}.table
elif [[ $diff -eq 1 ]]
then
echo -e  "\n$diff record wes successfully deleted.\n"
cat DataBases/$dbname/${tabname}.table
else
echo -e  "\nNo occurrence of $str was found.\n"
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
