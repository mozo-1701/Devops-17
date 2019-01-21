#!/bin/bash
storlek=($(find /usr/share -size +1M |wc))

if
  [ "$storlek" -ge 10 ] && [ "$storlek" -le 100 ]
then 
echo "There is more than 10 files"
fi

if
[ "$storlek" -ge 100 ] && [ "$storlek" -le 1000 ]
then
echo "There is more than 100 files"
fi

if
[ "$storlek" -ge 1000 ] && [ "$storlek" -l 10000 ]
then
echo "There is more than 1000 files"
fi

if
[ "$storlek" -ge 10000 ]
then
echo "There is more than 10000 files"
fi

echo "There is $storlek files which are more than 1MByte "
echo" "
# Making a chice menu.

echo " What do you want to do?"
echo" "
echo " 1. Compress these files in $HOME/arkiv"
echo " 2. Or do nothing, exit"

echo " What do you want to do?"

# Reading from standard input.

  read menu

         if [ "$menu" == "1" ]; then
#cheking if Directory exist.
       if [ -d "$HOME/arcive" ]; then 
#Finding all files under /usr/share an archiving as a file "usr_share.tar".

            find /usr/share -size +1M | xargs tar -cvf $HOME/arcive/usr_share.tar
         else
#cheking if Directory exist? If not it will be created.
            mkdir $HOME/arcive
            find /usr/share -size +1M | xargs tar -cvf $HOME/arcive/usr_share.tar
         fi

   else
          echo "  Do nothing, exit"
     
fi
echo " There was a total of $storlek files under /usr/share and is being acrchived as $/HOME/arcive/usr_share.tar "

