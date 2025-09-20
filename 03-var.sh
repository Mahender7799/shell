#!/bin/bash

#VAR_DATE=$(date +%Y-%M-%d)

START_TIME=$(date +%s)

sleep 10
echo "Date is $START_DATE" 

END_TIME=$(date +%s)

TOTAL=$(($START_DATE-$END_TIME))

echo "Total time to execute : $TOTAL"