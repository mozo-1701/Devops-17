#!/bin/bash
#echo "usage <./skript> 
#Store in ‘file 1’ the names of all employees whose basic pay is between 10000 and 15000.

cat employee| cut -f2,5  | grep '[10000.00-13000.00]'>./file1
