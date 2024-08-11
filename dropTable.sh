#! /bin/bash
#list availabel tables & send errors to /dev/null
. ./listTable.sh 2> /dev/null
echo $'Table name to be deleted:\t'
read tablename 2> /dev/null
cd ./MyDataBases/$database/ 2> /dev/null
if [[ -f $tablename ]]
then
	#
	rm $tablename
	echo "$tablename is deleted!"
else
	#
	echo "no matching table name"
fi
cd ../..
. ./Tables_Menu.sh

