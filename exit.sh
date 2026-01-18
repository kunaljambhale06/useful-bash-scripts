#!/bin/sh
read x
if [ $x -ne 10 ]
then
echo failed
exit 1
else
echo passed
exit 0
fi
