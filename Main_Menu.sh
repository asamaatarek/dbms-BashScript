#!/bin/bash

#checking if there is a directory containing all databases if it is not make One

if ! [[ -d ./MyDataBases ]]; then
	mkdir ./MyDataBases
fi

#Starting the main menu

#prompt name
PS3="Type the number of your choice: "

#select from the opening menu
select choice in "create a database" "list all databases" "connect to a database" "delete a databse" "clear screen except menu" "exit"; do
case $choice in

"create a database")  	   	echo -e "You are creating a new database\n"
				. ./creating_database.sh ;;
"list all databases")	  	echo -e "$(ls ./MyDataBases)\n" ;;

"connect to a database") 	echo -e "You are connecting to a databse\n"
				. ./connecting_database.sh;;

"delete a databse")		echo -e "You are now deleting a databse\n"
	                        echo -e "$(ls ./MyDataBases)\n"
				. ./deleting_database.sh;;

"clear screen except menu")     echo -e "Screen cleared\n"
				. ./clearing.sh;;

"exit")				clear
				echo -e "Thanks for using DBMS\n"
				exit;;

*) 				echo "Invalid choice, please try again"
				. ./Main_Menu.sh;;
esac
done
