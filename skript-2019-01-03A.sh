#!/bin/bash
echo "Usage: <./script >"
date=$(date '+%d-%m-%Y_%H:%M:%S')
echo $date
# Searching for all files which was changed under /etc  and making a compressed file.
find  /etc -atime -2 |xargs tar cvzf $(date +%F).backup.tar.gz


