#!/bin/bash
echo "Usage ./script "
# Searching all files in the ./ directory and moving all text files *.txt to *.txt.old .
for FILE in `find *txt -type f`

do
    echo "File is: $FILE" 
    mv $FILE $FILE.old  #Replace the FILE to FILE.old
    echo "File $FILE is moved to $FILE.old"

done

