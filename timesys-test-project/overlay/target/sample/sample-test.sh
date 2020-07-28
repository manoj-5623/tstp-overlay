#!/bin/sh -e
source "@TSTPLIB@"
echo hello world

if [ $? -eq 0 ]
then
	echo "ok"
fi
