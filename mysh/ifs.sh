#!/bin/bash 

var="google:yahoo:microsoft:apple:oracle:hp"
echo "original value of IFS is : $IFS"

OLD_IFS=$IFS
IFS=:

echo "new value of IFS : $IFS"

for word in $var;do
	echo -e $word
done <<< $var 

IFS=$OLD_IFS
echo -e "original value $IFS"
