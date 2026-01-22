#!/bin/sh
# Jan Brunner

if test $# -ne 1; then
	echo You need one paramter
	exit 1
fi
javaFile=false
filename=$(basename $1 .c)

if test $(echo $1 | cut -d. -f2) = java; then
	filename=$(echo $1 | cut -d. -f1)
	javaFile=true
fi
user=$(id -un)

test ! -d tmp/$user && mkdir -p tmp/$user

if test ! -e ./tmp/$user/$filename || test $1 -nt ./tmp/$user/$filename; then
	echo Compiling file $1
	if test $javaFile = true; then
		javac -d ./tmp/$user $1
	else
	  cc -Wall $1 -o ./tmp/$user/$filename
	fi
fi
if test $? -ne 0; then
	echo Error while compiling
	exit 1
fi

$javaFile && java -cp ./tmp/$user $filename
test $javaFile = false && ./tmp/$user/$filename
