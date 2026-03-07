#!/bin/bash

read -p "Enter a no:" no 

while [ "$no" -ge 0 ]

do
	echo "$no"
	((no--))
 

done

echo "Done!"
