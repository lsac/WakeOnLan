#!/bin/bash

options=("PC1,10:ff:e0:36:8d:66" "DESKTOP-OCF670,74:d4:35:94:ad:71" "LAPTOP-I28BFMO,10:e1:8e:3a:ae:fa" "DESKTOP-N2E1R8,e0:be:03:67:f5:44" "exit")
len=$((${#options[*]} + 0 ))

PS3="Select your favorite item (or $len to quit): "

select item in "${options[@]}"; do
    if [[ -n "$item" ]]; then # Check if a valid item was selected
        echo "You selected: $item (index: $((REPLY)))"
        break # Exit the loop after selection
    else
        echo "Invalid selection. Please try again."
    fi
done
#echo ${x%%,*}; echo ${x##*,}
key=${item%%,*}
val=${item##*,}
if [ "$key" = exit ];then
  echo exiting
  exit 1
else
  echo waking up $item
  echo "./WoL.sh $val"
fi
