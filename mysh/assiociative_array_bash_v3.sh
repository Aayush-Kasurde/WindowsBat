#!/bin/bash


array=(
    'hello::world.'
    'nice::to meet you'
)

for index in "${array[@]}" ; do
    KEY="${index%%::*}"
    VALUE="${index##*::}"
    echo "$KEY - $VALUE"
done
