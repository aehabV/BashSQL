# MySQL Simulator using Bash

[![Bash Badge](https://img.shields.io/badge/Bash-5.1.4-4EAA25.svg)](https://www.gnu.org/software/bash/)
[![Shell Badge](https://img.shields.io/badge/Shell-Bash%20%7C%20Zsh%20%7C%20Fish-4EAA25.svg)](https://en.wikipedia.org/wiki/Unix_shell)
[![License Badge](https://img.shields.io/badge/License-CC%20BY--NC%204.0-0a2c46.svg)](https://creativecommons.org/licenses/by-nc/4.0/legalcode)

BashSQL is a Bash project that simulates a SQL database system. It provides a command-line interface for performing basic database operations, allowing users to interact with simulated SQL databases using Bash scripts.

## Features

BashSQL provides the following features:

### Create database users

Users can create new database users using the `create_db_user.sh` script. By default, a system user called "oracle" is created. If the user running the script is "oracle" or an admin user, they can create new admin users. The script will prompt the user for a new admin username, and if the username already exists, a message will appear indicating that the user already exists. If the username is unique, it will be added to a file called `DB_admins.db`, which contains a list of admin users, including Oracle and any other created users.

### Delete database users

Only users in `DB_admins.db` can delete database users using the `delete_db_user.sh` script. The script will show the list of users in `DB_admins.db`, and the user can select a user to delete. The user "oracle" cannot be deleted. The script uses the `sed` command to remove the selected user from `DB_admins.db`.

### Create new databases

Only users in `DB_admins.db` can create new databases using the `create_db.sh` script. The script will prompt the user for a database name, and a directory with the entered name will be created under the path `MySQL/DataBases/YOUR_NEW_DB`. A file called `owner.txt` will be created in this directory containing the username of the user who created the database.

### Delete existing databases

Only users in `DB_admins.db` can delete existing databases using the `delete_db.sh` script. The script will show all available created databases inside `MySQL/DataBases`, and the user can select a database to delete. If the database owner is the same user who runs the script, the database directory and its contents will be deleted.

### Create tables inside databases

Only users in `DB_admins.db` can create tables inside databases using the `create_table.sh` script. The script will show all available created databases inside `MySQL/DataBases`. If the database owner is the same user who runs the script, the user will be prompted to enter a table name and the number of columns to create. If the table name does not already exist in the database, the user will be prompted to enter column names according to the entered number of columns. The final output for this script will create a file named with the entered table name inside the database directory.

### Insert new rows into tables

Only users in `DB_admins.db` can insert new rows into tables using the `insert_row.sh` script. The script will show all available created databases inside `MySQL/DataBases`, and the user can select a working database. If the selected database owner is the same user who runs the script, the script will show all available tables inside the database for the user to select from. For the selected table, the script will prompt the user to enter data for each column. The first column must be unique.

### Select data from tables

Users can select data from tables using the `select_data.sh` script. The script will show all available created databases inside `MySQL/DataBases`, and the user can select a working database. The script will then show all available tables inside the selected database for the user to select from. The user can choose to either show the content of the selected table or search inside the table for a specific string.

### Bonus feature: Delete rows from tables

Users can delete rows from tables using the `delete_row.sh` script. The script will show all available created databases inside `MySQL/DataBases`, and the user can select a working database. If the selected database owner is the same user who runs the script, the script will show all available tables inside the database for the user to select from. The user can choose a specific string, and the script will delete all rows that contain that string.

## Usage

To use BashSQL, follow these steps:

1. Clone the repository to your local machine.
2. Navigate to the MySQL directory.
3. Run the `main.sh` script.
4. Follow the prompts to create, delete, or modify databases and tables.
