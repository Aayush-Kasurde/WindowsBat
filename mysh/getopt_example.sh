#!/bin/bash 

help_ani(){
	echo "Usage "
	echo "-n name "
	echo "-a age" 
	echo "-s sex"
	echo "-w weight"
	echo "-h help"
	exit 1
}

if [ $# -lt 1 ]; then 
	help_ani 
fi 

while getopts n:a:s:w:d:h opt 
do 
	case "$opt" in 
	
	n) na="$OPTARG";;
	a) age="$OPTARG";;
	s) sex="$OPTARG";;
	w) weight="$OPTARG";;
	h) help_ani;; 
	esac 
done 

echo $na $age $sex $weight

	
