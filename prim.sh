#!/bin/sh
# Jan Brunner

limit=50
count=2

while test $count -le $limit; do
	valid=true
	divider=2
	
	while test $divider -lt $count; do
	calculation=$(expr $count % $divider)
	if test $calculation -eq 0; then
		valid=false
		break
	fi 
	divider=$(expr $divider + 1)
	done
	$valid && echo $count
	count=$(expr $count + 1)
done
