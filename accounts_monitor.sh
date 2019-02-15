#!/bin/bash
echo "Script made by Kewaii#3167"
if [ ! "$2" ]; then
 read -p "Type file name. [accounts.txt]:" accounts
 accounts=${accounts:-accounts.txt}
else
 accounts=$2
fi

if [ ! "$1" ]; then
 read -p "Type path where all generators are located. [.]:" path
 path=${path:-.}
else
 path=$1
fi

oldQty=0
qty=($(countlines.sh $path $accounts))
oldQty=qty
echo $(date -u +%T) $qty accounts found
sleep 60;
everysec=false
while true; do
  newQty=($(countlines.sh $path $accounts))
  difference=$((newQty - oldQty))
  oldQty=$newQty
  if [ "$difference" = 0 ]; then
     echo $(date -u +%T) No new accounts were generated. Recheck interval was set to 1 second
     everysec=true
  else
     echo $(date -u +%T) Generated $difference accounts since last minute
     everysec=false
  fi
  if [ "$everysec" = true ]; then
     sleep 1;
  else
     sleep 60;
  fi
done

