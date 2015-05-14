#!/bin/bash

# use -A option declares associative array
declare -A array

# Here, you can have some other process to fill up your associative array.
array["192.168.1.1"]="host1"
array["192.168.1.2"]="host2"
array["192.168.1.3"]="host3"
array["192.168.1.4"]="host4"
array["192.168.1.5"]="host5"

echo -n "Enter the ip address to know the hostname: "
read ipaddress

# Now you can use the associative array as hash table, (key,value) pairs.
echo "Hostname associated with the $ipaddress is: ${array[$ipaddress]}"

# You can also perform all the basic array operation.
# Iterate over Associative Arrays

#for hostname in "${array[@]}"; do
#       echo $hostname
#done
