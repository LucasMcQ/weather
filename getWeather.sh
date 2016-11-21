#!/bin/bash

JAVA_OBJ=Cleanup
JAVA_FILE=Cleanup.java
C_OBJ=checkTemp
C_FILE=checkTemp.c
FILE_WEATHER=weather.txt
DATA_OUT=data.txt
FINAL_OUTPUT=out.txt
CITY=Carefree

weather -f $CITY | grep 'Temperature' >> $FILE_WEATHER #-A3

rm -f $DATA_OUT $FINAL_OUTPUT

javac $JAVA_FILE
java $JAVA_OBJ ./$FILE_WEATHER >> $DATA_OUT

gcc -o $C_OBJ $C_FILE

./checkTemp ./$DATA_OUT >> $FINAL_OUTPUT

cat $FINAL_OUTPUT

#cat $DATA_OUT
rm $FILE_WEATHER $JAVA_OBJ.class $C_OBJ #$DATA_OUT 
