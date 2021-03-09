#1/bin/bash
# Add a blank line to make reading easier
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation 
#Grab the Dealers name from our Dealer analysis file
#grep -i "$Name" Dealers_working_during_losses |wc -l>>Notes_Dealer_Analysis
DealerName=$(head -1 /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Dealer_Analysis/Notes_Dealer_Analysis) # |sed -e 's/\s.*$//')
echo "After Analyzing the Lucky Duck Win Loss Logs we found that" "$DealerName" "was the Dealer that was rostered on during the times that all the losses occured." >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation 
echo "Evidence Provided below:">>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation 
# Count the number of losses and assign to a variable
NOL=$(grep -i loss /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses | wc -l)
echo "Number of Roulette Losses was" "$NOL" >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
# Count number of times the dealer apperas in the loss logs
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
NDA=$(awk -F" " '{print $3}' /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Dealer_Analysis/Dealers_working_during_losses|wc -l)
echo "Number of Times" "$DealerName" "appears on the days of the Losses is" "$NDA" "times." "  See Dealer Schedule below :">>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
cat /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Dealer_Analysis/Dealers_working_during_losses >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
# Grab the Players name from our Roulette loss logs by getting the player that appears the most and strip out the other names  
PlayerName=$(awk -F" " '{print $4,$5,$6,$7,$8,$9,$10,$11,$12,$13}' /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses |grep -wo '[[:alpha:]]\+'|  sort | uniq -d|paste -d" " -s)
echo "Analysis of the win loss logs showed that" "$PlayerName" "Played whenever there were losses" >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo "Evidence Provided below:">>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
# Just get Players First name to make search easier
SPN=$(echo "$PlayerName" |awk -F" " '{print $1}')
# Count number of times Player has won from the Roulette_Losses log 
NPW=$(grep -i "$SPN" /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses |wc -l)
echo "Number of Times" "$PlayerName" "has won" "$NPW" >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
#Get the Players Last name for the next search
PLN=$(echo "$PlayerName" |awk -F" " '{print $2}')
#Grab Roulette losses and colorize the output to highlight the player's name
grep -i "$SPN" /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Losses --color=always | grep "$PLN" --color=always >>/Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation 
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation
echo "Evidence shows that both" "$DealerName" "and" "$PlayerName" "were present at the time of the losses." >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation 
echo $'\n' >> /Lucky_Duck_homework/Lucky_Duck_investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation

