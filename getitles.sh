#!/bin/bash
# To get titles from list of URLs from file
# Usage: ./getitles.sh urls.txt
input=$1
while IFS= read -r line
do
  echo -n $line "        "
  wget -qO- $line | perl -l -0777 -ne 'print $1 if /<title.*?>\s*(.*?)\s*<\/title/si' 
done < "$input"
