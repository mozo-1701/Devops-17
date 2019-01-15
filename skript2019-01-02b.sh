#!/bin/bash
echo "Usage: https://github.com/...../archive/master.zip"
echo " Archiving files from Github location"
wget $1

echo "Packing up zip.file in $2"
unzip  -d $2/master.zip
