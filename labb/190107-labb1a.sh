#!/bin/bash
#set -x
echo "Ange username: "
read username
echo $username

if [ $username = $USER ]; then
   echo " User: $username is  logged in";

else

   echo " User: $username is not logged in";
fi
