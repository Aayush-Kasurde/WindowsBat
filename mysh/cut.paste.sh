#!/bin/bash

var="Linuxpoison.Linuxpoison.Linuxpoison"
echo
echo -e "Value of var is: $var"
echo "--------------------------------------------"
echo 'Find all *nux from the start of the string and cut ${var##*nux} :'
echo ${var##*nux}

echo "-------------------------------------------"
echo 'Find the first *nux from the start of the string and cut ${var#*nux} :'
echo ${var#*nux}

echo "-------------------------------------------"
echo 'Find all .* from the back of the string and cut ${var%%.*} :'
echo ${var%%.*}

echo "------------------------------------------"
echo 'Find first .* from the back of the string and cut ${var%.*} :'
echo ${var%.*}
