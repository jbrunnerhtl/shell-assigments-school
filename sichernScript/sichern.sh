#!/bin/sh
# Jan Brunner


backupDir=backup
unixTime=$(date +%s)



if test $# -gt 1; then
	echo Zu viele Parameter
	exit 1
fi

if test $# -eq 1; then
	backupDir=$1
fi

mkdir -p $backupDir

for i in *.sh *.txt; do
    test $i = "*.sh" -o $i = "*.txt" && continue
    secondsSince2026=$(date -d 2025-01-01 +%s)
    difference=$(expr $unixTime - $secondsSince2026)
    newFileName=$backupDir"/"$i
    echo Zeit: $difference
    if test ! -e $newFileName || test $i -nt $newFileName; then
    	echo "--> "$i 
    	cp $i $newFileName
    	cp $i $newFileName"."$difference
    fi

done
