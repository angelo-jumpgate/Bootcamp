#!bin/bash
# Input requires 2 varialbles monthday(ie 0310):hour:minutes:seconds  AM or PM as the second variable
grep -i 'AM\|PM' *03*|sed s/_Dealer_schedule/''/g|sed '/Hour/d'| grep "$1"|grep "$2" |awk -F" " '{print $1,$2,$5,$6}'>> Dealers_working_during_losses
