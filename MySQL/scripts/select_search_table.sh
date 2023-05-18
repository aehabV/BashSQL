#!/bin/bash
ls DataBases
read -p "Enter the database name: " dbname
if [[ $(find DataBases -type d -name $dbname | wc -l) -eq 1 ]]
then
if [[ $(ls DataBases/$dbname/ | wc -l) -ge 2 ]]
then
find DataBases/$dbname/ -name "*.table" | cut -d/ -f4 | cut -d. -f1
read -p "Enter table name: " tabname
if [[ $(find DataBases/$dbname -type f -name ${tabname}.table | wc -l) -eq 1 ]]
then
select option in "Display the contents of $tabname" "Search inside $tabname" "EXIT"
do
case $option in "Display the contents of $tabname")
cat DataBases/$dbname/${tabname}.table;;
"Search inside $tabname")
read -p "Enter the search string: " str
exist=$(grep -in "$str" DataBases/$dbname/${tabname}.table | wc -l)
if [[ $exist -ne 0 ]]
then
cat DataBases/$dbname/${tabname}.table | grep -in "$str"
else
echo "No such string was found in the table."
fi;;
"EXIT")
break;;
esac
done
else
echo "Table does not exist."
fi
else
echo "There are no tables in $dbname."
fi
else
echo "Database does not exist."
fi
