#!/bin/bash


#Starting the tables menu

PS3="Table_Menu: Type the number of your choice: "

echo $'Please choose an option: \n'

select action in 'Create Table' 'List Tables' 'Drop Table' 'Insert into Table' 'Select From Table' 'Delete From Table' 	'Update Table' 'Main Menu' 'Exit'
		do
			case $action in
			'Create Table') 
				. ./createTable.sh;;
			'List Tables') 
				. ./listTable.sh;;
			'Drop Table') 
			        . ./dropTable.sh;;
			'Insert into Table') 
				. ./insertRecord.sh;;
			'Select From Table') 
				. ./listTable.sh
				. ./selectRecord.sh;;
			'Delete From Table') 
				. ./deleteRecord.sh;;
			'Update Table') 
				. ./updateRecord.sh;;
			'Main Menu') 
				. ./Main_Menu.sh;;
			'Exit') 
				clear
				echo -e "See you later, Thanks for using our DBMS :)\n" 
				exit;;
			*)
				echo "Invalid choice, Redirecting to main menu..." 
				sleep 2
				. ./Main_Menu.sh;;
			esac
done
