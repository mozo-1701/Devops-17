#!/bin/bash
#echo "usage <./skript> 
#Display all records with EmpName starting with ‘B’.

cat employee | cut -f2|grep  -i 'smith'
