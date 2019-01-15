#!/bin/bash
echo "Usage: ./script "
# Printing  menu to standard  ouput.
echo "1. ls"
echo "2. pwd"
echo "3. ls –l"
echo "4. ps -fe"

# As long it is true, run the case statements
while true; do
echo "vilken kommando ska exekveras?"
# Reading from standard input.
  read arg

     case $arg in
       1)  /bin/ls  /etc ;;

       2)  pwd ;;

       3) /bin/ls -l /home ;;

       4)  /bin/ps -fe ;;
  #Exit if input is not between [1-4]
       *) exit 1
     esac
done

