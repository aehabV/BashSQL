uname=$(whoami)
if [[ $(cat DB_admins.db | grep -w $uname | wc -l) -eq 1 ]]
then	
select option in "Create database user" "Delete database User" "Create new database" "Delete an existing database" "Create a new table inside database" "Insert a new row in a table" "Select data from table" "Delete row from table" "EXIT"
do 
case $option in
"Create database user")
. scripts/create_user.sh;;
"Delete database User")
. scripts/delete_user.sh;;
"Create new database")
. scripts/create_database.sh;;
"Delete an existing database")
. scripts/delete_database.sh;;
"Create a new table inside database")
. scripts/create_table.sh;;
"Insert a new row in a table")
. scripts/insert_table.sh;;
"Select data from table")
. scripts/select_search_table.sh;;
"Delete row from table")
. scripts/delete_row.sh;;
"EXIT")
break;;
*)
echo "Invalid option";;
esac
done
else
select option in "Select data from table" "EXIT"
do
case $option in
"Select data from table")
. scripts/select_search_table.sh;;
"EXIT")
break;;
*)
echo "Invalid option";;
esac
done
fi
