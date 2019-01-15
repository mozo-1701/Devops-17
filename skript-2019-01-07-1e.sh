#!/bin/bash
echo "Usage: ./script"
echo "Printing out 10 to 1"
j=10
# As long as j is ge 10 , print out j .
while [ $j -ge 1 ]
do
   echo -n "$j "
   j=$(( j - 1 )) # decrease number by 1 
done
echo ""
