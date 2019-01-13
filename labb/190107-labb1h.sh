#!/bin/bash
echo "Usage ./script "

for FILE in `find *txt -type f`

do
    echo "File is: $FILE" 
    mv $FILE $FILE.old  #Replace the FILE to FILE.old
    echo "File $FILE is moved to $FILE.old"

done

