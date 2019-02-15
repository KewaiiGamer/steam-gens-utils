#!/bin/bash
if [ ! "$1" ] || [ ! "$2" ]; then
 echo "Invalid arguments. Usage: countlines <folder> <filename>"
 exit 1
else
 accounts=$2
 dire=$1
fi
qty=0
path=$(readlink -m $dire)
echo $path/*
for d in "$path/*"
do
if [  -f "$d/$accounts" ]; then
cd $d
newQty=($(wc -l $accounts))
qty=$((qty + newQty))
cd ..
fi
done
echo $qty
