#!/bin/bash
echo "Usage: <./script> <filename>"
echo "File name:"
# Reading from standard input.
read file
echo "File name: $file"
# Cheking if file is executable or not?
if [[ -x "$file" ]]
then
   ls -l $file
   echo  "File: $file is executable"
else
   ls -l $file
echo  "File: $file is not not executable"
   chmod +x $file
   ls -l $file
   
fi

