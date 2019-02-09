#!/bin/bash
echo "Script made by Kewaii#3167"
oldQty=0
qty=($(wc -l accounts.txt))
echo $qty accounts found
sleep 60;
while true; do
  newQty=($(wc -l accounts.txt))
  difference=$((newQty - oldQty))
  oldQty=$newQty
  echo Generated $difference accounts since last minute
  sleep 60;
done

