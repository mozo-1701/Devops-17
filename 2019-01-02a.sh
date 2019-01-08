#!/bin/bash

DIR=/home/labb/DevOps-17/labb

if [ -d $DIR ] ; then
   echo " Directory is already created" 
   echo " Creating file1  in DIR  "
   touch file1

else
    echo " Trying to make DIR and file1" 
    mkdir $DIR
    touch file1
    mv file1 $DIR

fi
