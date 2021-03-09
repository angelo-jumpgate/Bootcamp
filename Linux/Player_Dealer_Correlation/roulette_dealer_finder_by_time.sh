#!bin/bash
# Input requires 2 varialbles monthday(ie 0310)  as the first variable then hour:minutes:seconds and(no spaces)  AM or PM as the second variable
grep -i 'AM\|PM' *_Dealer_schedule|sed s/_Dealer_schedule/''/g|sed '/Hour/d'|awk -F" " '{print $1$2,$5,$6}'| grep "$1"|grep "$2"|awk -F" " '{print $1,$2,$3}'
