#!/bin/bash
#Extract Dealer from Dealers_working_during_losses and add it to  Notes_Dealer_Analysis
awk -F" " '{print $3,$4}' Dealers_working_during_losses >>Notes_Dealer_Analysis
# Grab the Dealers first name and use it to count how many entries they appear in
Name=$(head -1 Notes_Dealer_Analysis|sed -e 's/\s.*$//')
#echo "$Name"   Just testing
grep -i "$Name" Dealers_working_during_losses |wc -l>>Notes_Dealer_Analysis

