#!/bin/bash
#echo "usage <./skript> 
#Display the records on Employees whose grade is E2 and have work experience of 2 to 5 years.

cat employee |cut -f3  | grep E2 | cat employee |cut -f4  | grep '[2-5]'
