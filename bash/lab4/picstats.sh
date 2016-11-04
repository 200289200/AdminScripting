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
havedir=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help )
        usage
        exit 0
        ;;
    -c | --count )
        if [[ $2 =~ ^[1-9][0-9]*$ ]]; then
            numoffiles=$2
            shift
        else
            usage
            error-message
            exit 1
        fi
        ;;
    * )
        if [ $havedir = "no" ]; then
            defaultdir=$1
            havedir="yes"
        else
            usage
            error-message
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