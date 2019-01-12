#!/bin/bash
#set -x
echo "File name:";
read file
echo "File name: $file"
if [[ -x "$file" ]]
then
   ls -l $file
   echo  "File: $file is executable"
else
   ls -l $file
echo  "File: $file is not executable"
   chmod +x $file
   ls -l $file
   echo $filename
fi

