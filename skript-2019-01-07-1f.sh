#!/bin/bash
echo "Usage: <./script "
# As long it is true, read from standard input.
while true; 
do
  printf "Give a number:  "
  read input
  echo "Printing down $input to 1"
#Printing staring value and count down .
j=$input
#Do the loop as long as j is greater or equal 1 .
   while [ $j -ge 1 ]
   do
   echo -n "$j "
   j=$(( j - 1 )) # decrease number by 1 
   done
printf "\n"
done


