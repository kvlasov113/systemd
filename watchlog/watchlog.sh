#!/bin/bash

WORD=$1
LOG=$2
DATE=`date`

if grep $WORD $LOG &> /dev/null
then
logger "$DATE: I found word, Master!" #Команда logger отправлāет лог в системнýй журнал
else
exit 0
fi
