#!/bin/bash

echo "All the variable passed to the script : $@"
echo "All the variable passed to the script : $*"
echo "script name: $0"
echo "current directory : $PWD"
echo "Who is running this: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script: $$"
sleep 50 &
echo "PID of the last command in backgound is : $!"
