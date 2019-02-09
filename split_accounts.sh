#!/bin/bash
echo "Script made by Kewaii#3167"
amount=$1
accounts=0
        if [ -f accounts.txt ]; then
                account=$(cat accounts.txt)
        fi
i=0
while read -r line; do
if [ ! -z "$line" ] && [ "$i" -lt "$amount" ]
then
	((i++))
         echo "$line" >> $2
fi
done <<< "$account"
sed -i "1,${amount}d" accounts.txt




