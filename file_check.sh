#!/bin/bash

echo "Enter filename to check:"
read file

if [ -e "$file" ]; then
  echo "File '$file' exists."
else
  echo "File '$file' does not exist."
fi
