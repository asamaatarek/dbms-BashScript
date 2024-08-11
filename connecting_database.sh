#!/bin/bash

#Selecting one of the available databases
	
#listing available databases	
echo -e "Existing databases are: "

# send errors to /dev/null
ls ./MyDataBases 2> /dev/null

echo $'Please Enter database name to connect it:\n'
read database 2> /dev/null

if [[ -d ./MyDataBases/$database ]]
then
       #redirect to the selected database
       cd ./MyDataBases/$database 2> /dev/null 
       echo 'Connected to' $database
       cd ../..
       . ./Tables_Menu.sh
else	
	echo "no database with $database name"
	echo $'\nDo you want to create it? [y/n]\n'
	read answer
	case $answer in
	        y)
		. ./creating_database.sh;;
		n)
		connectDB;;
		*)
		echo "Incorect answer, Redirecting to main menu..." ;
		sleep 2
		. ./Main_Menu.sh;;	
esac
fi	

