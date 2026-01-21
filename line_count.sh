#!/bin/bash

echo "Enter filename:"
read filename

if [ -f "$filename" ]; then
  lines=$(wc -l < "$filename")
  echo "The file '$filename' has $lines lines."
else
  echo "File not found."
fi
