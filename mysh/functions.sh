#!/bin/bash 

read -p "Enter a your name" NAME 
echo $NAME

if [ "$NAME" = "" ]
then
	read -p "Enter text" NAME
	echo "Ye $NAME" 
else
	echo "hello $NAME"
fi

for args in 1 2 3 4 5 6 7 8 9 10 
do
	echo $args 
done

i=1 
while [ $i -le 10 ] 
do 
	echo $i 
	i=$[$i+1]
done

func()
{
	echo "hello from function"
}

func

today()
{
	echo This is a `date +"%A %d in %B of %Y (%r)"`
	return
}

today

today()
{
	echo This is a `date +"%A %d in %B of %Y (%r)"`
	return
}
read -p "Enter any number from 1 to 5 " yourch 

case $yourch in
	1) echo "Today is `date` , press a key. . ." ; read ;;
	2) echo "Files in `pwd`" ; ls -l ;
	   echo "Press a key. . ." ; read ;;
	3) cal ; echo "Press a key. . ." ; read ;;
	4) vi ;;
	5) exit 0 ;;
	*) echo "Opps!!! Please select choice 1,2,3,4, or 5";
		echo "Press a key. . ." ; read ;;
esac 

for i in $(seq -w 1 10)
do
	echo $i 
done
