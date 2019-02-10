#!/bin/bash
echo "Script made by Kewaii#3167"
oldQty=0
qty=($(wc -l accounts.txt))
oldQty=qty
echo $(date -u +%T) $qty accounts found
sleep 60;
everysec=false
while true; do
  newQty=($(wc -l accounts.txt))
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

