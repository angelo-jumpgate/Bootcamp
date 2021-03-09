#!/bin/bash
# Input requires 2 varialbles monthday(ie 0310)  as the first variable then hour:minutes:seconds and(no spaces)  AM or PM as the second variable
echo -n "Select 1 for Blackjack, 2 for Roulette or 3 for Texas Hold Em ..Enter a number: "
read VAR
if [ "$VAR" = "1" ] ; then
    grep -w -i 'AM\|PM' *_Dealer_schedule|sed s/_Dealer_schedule/''/g|sed '/Hour/d'|awk -F" " '{print $1$2,$3,$4}'| grep "$1"|grep "$2"|awk -F" " '{print $1,$2,$3}'
elif [ "$VAR" = "2" ] ; then
     grep -w -i 'AM\|PM' *_Dealer_schedule|sed s/_Dealer_schedule/''/g|sed '/Hour/d'|awk -F" " '{print $1$2,$5,$6}'| grep "$1"|grep "$2"|awk -F" " '{print $1,$2,$3}'
elif [ "$VAR" = "3" ] ; then
     grep -w -i 'AM\|PM' *_Dealer_schedule|sed s/_Dealer_schedule/''/g|sed '/Hour/d'|awk -F" " '{print $1$2,$7,$8}'| grep "$1"|grep "$2"|awk -F" " '{print $1,$2,$3}'
else
    echo "Try again Select 1 for Blackjack, 2 for Roulette or 3 for Texas Hold Em"
fi

