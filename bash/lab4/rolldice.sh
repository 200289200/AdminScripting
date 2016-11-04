#!/bin/bash
#Rolls user specified number of dice, with user specified nummber of faces

################################################################################

#Declarations of Variables
declare -i dice
declare -i sides
declare -i many
 
################################################################################

#Creation of Functions
 
function info {
  echo "Usage: $0 [-h] [-d #] [-s #]"
}

function error-message {
 echo "$@" >&2
 echo "Please type a valid number!" >&1
}

function value {

#Until a valid number has been input, print out statement asking for valid number, and repeat opening statement.
until [[ $value =~ ^[1-5]$ ]]; do
  read -p "How many dice shall I roll [1-5]? " value
    if [ "$value" -lt 1 -o "$value" -gt 5 ]; then
      error-message
    fi

  [ -n "$value" ] || continue
done
}

function sides {
    #Until a valid number has been input, print out statement asking for valid number, and repeat opening statement.
    while [ "$sides" -lt 4 -o "$sides" -gt 20 ]; do
      read -p "How many sides should the dice have [4-20]? " sides
     #Added if statement to print out message; to type a valid number. vvv
      if [ "$sides" -lt 4 -o "$sides" -gt 20 ]; then
        error-message
      fi

      [ -n "$sides" ] || continue

      if [[ "$sides" =~ ^[1-9][0-9]*$ ]]; then
        if [ "$sides" -ge 4 -a "$sides" -le 20 ]; then
          break
        fi
      fi

done  
}

function HowMany {
while [ "$many" -lt 1 -o "$many" -gt 2 ]; do
  read -p "How many times would you like each die to be rolled? [1-2]? " many
  
  if [ "$many" -lt 1 -o "$many" -gt 2 ]; then
    error-message
  fi 
  
  
  [ -n "$many" ] || continue
 #sides must be in range of 1-2.
  if [[ "$many" =~ ^[1-2][1-2]*$ ]]; then
    if [ "$many" -gt 0 -a "$many" -lt 3 ]; then
      #break
      hello
    fi
  fi
  
done
}

function once {
  for (( rolls=0 ; rolls < value ; rolls++ )); do
  # roll the dice
    die1=$(($RANDOM % $sides +1))
    total=$(($total+$die1))
    # show the roll results
    echo "Rolled ${bold}$die1${normal}."
  done
        echo "==================="
        echo "For a total of ${bold}$total${normal}."
        echo "The program has ended!"
}

function twice {
  for (( rolls=0 ; rolls < value ; rolls++ )); do
  # roll the dice
    die1=$(($RANDOM % $sides +1))
    die2=$(($RANDOM % $sides +1))
    total=$(($die1 + $die2))
    # show the roll results
    echo "First roll was ${bold}$die1${normal} and the second roll was ${bold}$die2${normal}, for a total of ${bold}$total${normal}"
  done
        echo "==================="
        echo "The program has ended!"
}

function hello {

if [ "$many" = 2 ]; then
  twice
fi

if [ "$many" = 1 ]; then
  once
fi
}
 
#Defaulting value to 0
dice=0
sides=0
many=0

bold=$(tput bold)
normal=$(tput sgr0)
 
################################################################################
 
#Commence the while loop!
while [ $# -gt 0 ]; do
    case "$1" in
    -h )
        info
        echo "Number required for -d, from 1 to 5"
    echo "Number required for -s, from 4 to 20"
        exit 0
        ;;
        
    #For dice: If the number is in the accepted range of 1-5, the dice variable becomes that number, otherwise, you'll get an error message.
    -d )
    if [[ "$2" =~ ^[1-5]$ ]]; then
      dice=$2
      shift
    else
      error-message "Need a number in the range of 1-5!"
      exit 2
    fi
    ;;
    
    #For sides: If the number is in the accepted range of 4-20, the dice variable becomes that number, otherwise, you'll get an error message.
    -s )
    if [ "$2" -ge 4 -a "$2" -le 20 ]; then
      sides=$2
      shift
    else
      error-message "Need a number in the range of 4-20!"
      exit 2
    fi
    ;;
    #For many: If the number is in the accepted range of 1-2, the many variable becomes that number, otherwise, you'll get an error message.
    -s )
    if [ "$2" -ge 1 -a "$2" -le 2 ]; then
      main=$2
      shift
    else
      error-message "Need a number in the range of 1-2!"
      exit 2
    fi
    ;;
    #If there is any other form of incorrect input by the user, print out the info and error-message functions.
    * )
        info
        error-message "Argument '$1' is invalid"
        exit 2
        ;;
    esac
    shift
done
 
################################################################################

#Main

value
sides
HowMany

################################################################################