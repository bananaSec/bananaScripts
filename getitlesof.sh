#!/bin/bash
# To get titles from list of URLs from file
# Usage: ./getitles.sh urls.txt
path=$2
host=$1
while IFS= read -r line1
do
  while IFS= read -r line2
  do
    line=$line1$line2
    echo -n $line "        "
    wget -qO- $line | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si'.'\n'
  done < "$path" 
done < "$host"
