#!/bin/bash
#A script that takes the user's input (number of seconds), and counts down from there.
#Option to reset the counter with Ctrl+C, end program with ctrl+\

#Declarations
declare -i input1
declare -i count
#bankruptcy

################################################################################

#Initial value set to 0
input1=0
count=0

################################################################################
#Creating Functions

function info {
  echo "Input any number from 0 and up.
Ctrl+C to restart the countdown, Ctrl+\ to quit."
}

function error-message {
 echo "$@" >&2
 echo "Please input a valid number!" >&1
}

function main {
    while [ -z "$count" -o "$count" = "0" -o "$count" -lt "0" ]; do 
        read -p "How many seconds? " input1
        
        count=input1
        
        #Test statements for if the value of $count is non-existant, has a value of 0, or ir less than 0. If any are true, do the following.
        if [[ -z "$count" ]] || [[ "$count" = "0" ]] || [[ "$count" -lt "0" ]]; then
            echo ""
            error-message
            info
            echo ""
        fi
done

#Only starts if timeremaing is greater than 0    
while [ $count -gt 0 ]; do

    
    echo "$count seconds"
    count=$(($count-1))
    sleep 1 &
    wait $!
    
done
    
}

function ctrlc {
    echo ""
    count=input1
    #let the user know the timer is reset
    echo "Counter has been reset to $input1."

}

function quit {
echo ""
echo "You have ended the program!"
exit 0
}

################################################################################
while [[ 1 ]]; do
#Essentially, the program is going to run and re-run until it catches an interrupt or quit signal.

#Look for the user input of "Ctrl+C", and "Ctrl+\". If either happens, do the listed function.
trap quit SIGQUIT
trap ctrlc SIGINT

#Show info function
info
#Run the main function
main

done
################################################################################