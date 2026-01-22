#!/bin/sh
# Jan Brunner

firstPart=1

while test $firstPart -le 10; do
	secondPart=1
	while test $secondPart -le 10; do
	product=$(expr $firstPart \* $secondPart)
	echo $firstPart \* $secondPart = $product
	secondPart=$(expr $secondPart + 1)
	done
	echo 
	firstPart=$(expr $firstPart + 1)
done
