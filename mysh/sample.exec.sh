#!/bin/bash -x
exec 4< inp2.txt           # opening  file via descriptor
while read LINE <&4; do
printf "%s\n" "$LINE"  # just to watch that command is proper
$LINE                # execute command
done