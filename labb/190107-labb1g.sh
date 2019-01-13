#!/bin/bash
echo "Usage ./script <text> <integer>"

  echo "Printing down $2 to 1"
j=$2
   while [ $j -ge 1 ]
   do
     echo -n "$j "
     j=$(( j - 1 )) # decrease number by 1 
   done
printf "\n"


