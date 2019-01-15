#!/bin/bash

echo "Usage: script <directory> <file name>"

if [ -d $1 ] ; then
   echo " Directory is already created" 
   echo " Creating file: $2  in directory: $1  "
   touch $2
   echo "Moving file: $2 to directory: $1"
    mv  $2 $1

else
    echo " Trying to make  directory $1 " 
    mkdir $1
    echo " Creating file $2  "
    touch $2
    echo "Moving file: $2 to directory: $1"
    mv  $2 $1

fi
