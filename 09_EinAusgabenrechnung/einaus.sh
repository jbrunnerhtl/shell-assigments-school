#!/bin/sh
# Jan Brunner

exec <einaus.txt
sum=0
ein=0
aus=0
while read a b; do

	pointValue=$(echo $b | tr ',' '.')
	case $a in
	ein) ein=$(echo "$ein + $pointValue" | bc);;
	aus) aus=$(echo "$aus + $pointValue" | bc);;
	*) echo Error while calculating && exit 1;;
	esac
done 
sum=$(echo "$ein - $aus" | bc)
sum=$(echo $sum | tr '.' ',')
ein=$(echo $ein | tr '.' ',')
aus=$(echo $aus | tr '.' ',')
echo Die Summe ist $sum €
echo Die Einnahmen sind $ein €
echo Die Ausgaben sind $aus €

