#!/bin/sh
# Jan Brunner

if test $# -ne 2; then
	echo You need two parameters
	exit 1
fi

while true; do
	currentDate=$(date | cut -c12-16)
	echo Current time $currentDate
	test $currentDate = $1 && break
	sleep 1
	
done
$2
