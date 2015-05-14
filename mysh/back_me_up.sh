#!/bin/sh 

if [ $(whoami) != "root" ] 
then
	echo Yes i am root ;
	tar -pcvzf ./`date +%d-%m-%y`.tar.bz ./repo 
else 
	echo no ;
fi


