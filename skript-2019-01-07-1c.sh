
#!/bin/bash
echo "Usage ./script < string > " 
# Printing out standard input string in reverse.
o=
for i;do
    o="$i $o"
    done

printf "%s " $o
printf "\n"

