#!/bin/bash

if [ "$#" -lt 2 ] | [ "$1" == "--help" ]; then
  echo -e "Mygrep bash script\nUsage: $0 [-i] [-v] search_string filename\n[options]\n[-n] print line number\n[-v] print the inverse of the search\nyou can use any combination of options"
  exit 1
fi



line_p=false
invert=false

while [[ "$1" == -* ]]; do
  case "$1" in
    -n) line_p=true ;;
    -v) invert=true ;;
    -nv) invert=true && line_p=true ;;
    -vn) invert=true && line_p=true ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [-i] [-v] search_string filename"
      exit 1
      ;;
  esac
  shift
done


search_string="$1"
filename="$2"


if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi


search_string_lower=$(echo "$search_string" | tr '[:upper:]' '[:lower:]')


line_number=1
while IFS= read -r line; do
  line_number=$((line_number + 1))
  

  line_lower=$(echo "$line" | tr '[:upper:]' '[:lower:]')
  
  if [[ "$line_lower" == *"$search_string_lower"* ]]; then
    match=true
  else
    match=false
  fi

  if { $match && ! $invert; } || { ! $match && $invert; }; then
    if $line_p; then
      echo "$line_number:$line"
    else
      echo "$line"
    fi
  fi
done < "$filename"
