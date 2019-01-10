#!/bin/bash
#for arg in ls 'ls -l'
#do
#set -x
echo "1. ls"
echo "2. pwd"
echo "3. ls –l"
echo "4. ps -fe"

while true; do
echo "vilken kommando ska exekveras?"
  read arg

     case $arg in
       1)  /bin/ls  /etc ;;

       2)  pwd ;;

       3) /bin/ls -l /home ;;

       4)  /bin/ps -fe ;;

       *) exit 1
     esac
done

