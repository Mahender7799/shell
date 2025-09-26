#!/bin/bash

NUMBER=$1 # Passing argument as input

if [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is less ythan 10"

elif [ $NUMBER -eq 10 ];then
     echo "Givrn number $NUMBER is equal to 10"
else
  echo "Given number is greater than  10"
fi      