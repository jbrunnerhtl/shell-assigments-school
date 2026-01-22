#!/bin/sh
# Jan Brunner

checkIfLastCompileHadError() {
	if test $? -ne 0; then
		echo Error while compiling
		exit 1
	fi
}

allOFiles=""
executableName="./out/"$(basename "$(pwd)")
needToCompile=false

test ! -e ./out && mkdir -p out
for i in *.c; do
	filename=$(basename $i .c)".o"
	if test ! -e ./out/$filename || test $i -nt ./out/$filename; then
		echo - Compile $i
		needToCompile=true
		cc -c $i -o ./out/$filename
		checkIfLastCompileHadError
	fi 
	allOFiles=$allOFiles" ./out/$filename"
	
done
if test $needToCompile = true; then
	echo - Link $allOFiles to $executableName 
	cc $allOFiles -o $executableName
	checkIfLastCompileHadError
fi
echo - Start $executableName
$executableName
