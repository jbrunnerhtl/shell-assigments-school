#!/bin/sh
# Jan Brunner - funktioniert komplett
mkdir -p meer
mkdir -p berge
for i in *.jpeg; do
	test $i = "*.jpeg" && continue
	x=$(exiftool $i | grep "Date/Time Original" | head -1 | cut -c37-55)
	altitude=$(exiftool $i | grep "GPS Altitude" | tail -1 | cut -c35-50 | cut -d' ' -f1)
	
	
	year=$(echo $x | cut -d: -f1)
	x=$(echo $x | tr -d ':')
	x=$(echo $x | tr ' ' '-')
	mkdir -p $year
	mv $i $year'/'$x'.jpeg'
	
	if test -n "$altitude"; then	
		if test $(echo "$altitude > 800" | bc) -eq 1; then
			ln -s  "$(pwd)/$year/$x.jpeg" "berge/$x.jpeg"
		elif test $(echo "$altitude < 50" | bc) -eq 1; then
			ln -s "$(pwd)/$year/$x.jpeg" "meer/$x.jpeg"
		fi
	fi	
done
