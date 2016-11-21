#!/bin/bash

# This will get the things you need to run.

if [ $(dpkg-query -W -f='${Status}' weather-util 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
		sudo apt-get install weather-util
		sudo apt-get purge weather-util-data
		mkdir -p ~/.weather/weatherrc
		wget -P $HOME/.weather/ http://fungi.yuggoth.org/weather/src/weather/{airports,places,stations,zctas,zones}
fi



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
rm $FILE_WEATHER $JAVA_OBJ.class $C_OBJ $DATA_OUT 
