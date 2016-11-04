#!/bin/bash
#A script that will show the specified number of files in the specified directory, how much disk space they use.
#It is set to show the top 3 largest files w/ their names.

################################################################################

#Declaring Variables

declare -i files #How many files are going to be shown
declare -i count #How many files are in the specified directory

#Creating Variables/Setting default Values

defaultdir=~/Pictures #Defaulting to the ~/Pictures directory
numoffiles=3 #Showing the top 3 files
where=0
existingdir=false

################################################################################

#Creating Functions

function info {
    echo "To end the program, use Ctrl+C"
}

function examples {
    echo "Ex. Pictures, bin, lib, ..."
}

function usage {
  echo "Usage: $0 [-h] [-c #] [directory]"
}

function error-message {
 echo "$@" >&2
 echo "An error has occured $@" >&1
}

################################################################################

#While loop

#Begin the while loop / case tests!
while [ $# -gt 0 ]; do
    case "$1" in
        -h )
            usage
            exit 0
            ;;
        #If the input is in the accepted range, set numoffiles to that number, otherwise give an error message.
        -c )
            if [[ "$2" =~ ^[1-9][0-9]* ]]; then
                numoffiles=$2
                shift
            else
                echo "Usage: $0 [-h] [-c #] [directory]" >&2
                error-message "-c option requires a count"
                exit 1
            fi
            ;;
        * ) 
            if [ $there = "false" ]; then
                defaultdir=$1
                existingdir=true
            else
                echo "Usage: $0 [-h] [-c #] [directory]" >&2
                error-message "I wasn't able to understand: $1 " >&2
                exit 1
            fi
            ;;
    esac
    shift
done

################################################################################

#Main

while [ 1 ]; do
    cd ~
    #cd ~
    info
    examples
    read -p "Where would you like to look: ./" there
    
    echo ""
    
    totalspaceused=`du -sh "$there" | awk '{print $1}'`
    echo "The "$there" directory uses $totalspaceused"
    
    count=`find "$there" -type f | wc -l`
    echo "In the $there directory, there are $count files."
    
    echo "The $numoffiles largest files in the $there directory are:"
    echo "===================================================="
    du -h "$there"/* | sort -h | tail -$numoffiles
    echo ""
done