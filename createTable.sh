#!/bin/bash
cd ./MyDataBases/$database 2> /dev/null
echo $'Please enter table name to create it: \n'
read table 2> /dev/null
if [[ -f $table ]]
then
	echo "table already exists!"
	cd ../..
	. ./connecting_database.sh
else
	touch $table 
	echo "table created successfully!"
fi

echo "enter Number of fields: " 
read fields 2> /dev/null
num='^[0-9]+$'
if [[ $fields =~ $num ]]
then	
       #primary key mark 
       mark="true"
       for (( i=1; i<=$fields ; i++ ))
       do
	      echo "Please enter name for field no.$i"
	      read colname
	      #setting Primary Key for the field
	      while [ $mark == "true" ]
	      do
		      echo "IS this a primary key?[y/n]"
      		      read pk
		      if [[ $pk == "y" || $pk == "Y" || $pk == "yes" ]]
		      then 
			      #change the value of the mark so never enter the loop again if the user select a field as PK
	      		      mark="false"
			      #echo [-n] no new line so it will append (PK) to the field name
			      echo -n "(PK)" >> $table
		      else 
			      break 
		      fi
	      done
	      #setting column data type 
	      while true 
	      do 
		      echo "choose data type from(int,varchar)"
		      read datatype 2> /dev/null
		      case $datatype in 
			      #append data type to the field name
			      int)
			      echo -n $colname"($datatype);" >> $table;;
		      varchar)
			      echo -n $colname"($datatype);" >> $table;;
		      *)
			      echo "Incorrect Data type!"
			      continue;
	             esac
		     break 
	     done
        done
        #end of table header 
        echo $'\n' >> $table
        echo "Your table $table created"
        #redirect to Table_Menu
        cd ../..
        . ./Tables_Menu.sh
else
	#if user enter anything except numbers
	echo "$fields is not valid input. Please enter numbers only !"
	sleep 2
	. ./createTable.sh
fi

