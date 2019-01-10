#!/bin/bash
echo $(date) 'Running wget...'
wget $1

echo "Packing up zip.file in $2"
unzip  $2/master.zip
