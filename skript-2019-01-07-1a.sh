#!/bin/bash
echo "Usage: <./script> "
echo "Ange username: "
# Reading from standard input
read username
# Cheking if username is already logged in or not?
if [ $username = $USER ]; then
   echo " User: $username is  logged in";

else

   echo " User: $username is not logged in";
fi
