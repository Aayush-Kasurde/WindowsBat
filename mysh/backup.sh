#!/bin/bash 
if [ "$1" == "" ]; 
then 
	echo "No File specified to backup " 
else 
	mydate=`date +'%d-%m-%y'` 
	echo $mydate 
	echo "making backup of $1 into $1.$mydate.orig" 
	cp "$1" "$1.$mydate.orig" -v
	if [ $? -ne 0 ];
	then	
		echo "Error " 
	else 
		echo "Success" 
	fi 
fi 

