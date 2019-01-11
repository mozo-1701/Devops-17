#!/bin/bash
while true; do
read input
echo "Printing down $input to 1"
j=$input
while [ $j -ge 1 ]
do
   echo -n "$j "
   j=$(( j - 1 )) # decrease number by 1 
done
done
echo ""

