#!/bin/bash

argSha="$1"
file="$2"
if [[ -z "$argSha" || -z "$file" ]]; then
  echo "Missing arguments"
  exit 4
fi
calcSha=($(shasum $2))

if [[ "$argSha" == "$calcSha" ]]; then
#set $match
echo "$calcSha"
exit 0
fi
exit 8
#echo $match