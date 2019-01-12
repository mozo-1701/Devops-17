#!/bin/bash
echo "printing out 10 to 1"
j=10
while [ $j -ge 1 ]
do
   echo -n "$j "
   j=$(( j - 1 )) # decrease number by 1 
done

echo ""
