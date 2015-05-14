#!/bin/bash

echo -n "Enter the String: "
read String

echo -n "You entered : "
echo ${String}

echo -n "Only First characters to uppercase: "
echo ${String^}

echo -n "All characters to uppercase: "
echo ${String^^}

echo -n "Only First characters to Lowercase: "
echo ${String,}

echo -n "All characters to lowercase: "
echo ${String,,}