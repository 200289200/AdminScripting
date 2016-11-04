#!/bin/bash
#Asking for user input and displaying the corresponding interface
#I'd like to take a moment to thank my peers and the internet for helping make this script actually function.

#Could expand on this script; if time, add feature that loops until user exits program.

################################################################################

#Variables / Declarations

declare -i whatint
declare -a rewq

defaultroute="false"
whatint=0

names=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

declare -a ips
poiu=0

################################################################################

#Functions

function info {
  echo "Usage: $0 [-h] [-c #] [-i #]"
}

function guide {
    echo "Example: 1- eth0, 2 - lo -- Up to 7, 8 - Default Gateway, 9 - Show All"
}

function error-message {
 echo "$@" >&2
 echo "Please input a valid number!" >&1
}

function which {
    
#while [ "$whatint" = 0 ]; do
while [ 1 ]; do       
    read -p "Type a number based on the order to see the corresponding interface: " input1
        
        whatint=input1
    #
    #Probably a much better way to do the following, but it'll have to do for now!
    #
        #Test statements for if the value of $whatint is non-existant, has a value of 0, or ir less than 0. If any are true, do the following.
        #Given options for up to 8 different interfaces, 9 is set for the default gateway.
        if [[ "$whatint" = 1 ]]; then
            echo""
            echo "Interface ${intname[0]} has address ${rewq[0]}"
            echo""
            #exit 1
        fi
        
        if [[ "$whatint" = 2 ]]; then
            echo""
            echo "Interface ${intname[1]} has address ${rewq[1]}"
            echo""
            
        fi
        
        if [[ "$whatint" = 3 ]]; then
            echo""
            echo "Interface ${intname[2]} has address ${rewq[2]}"
            echo""
            
        fi
        
        if [[ "$whatint" = 4 ]]; then
            echo""
            echo "Interface ${intname[3]} has address ${rewq[3]}"
            echo""
            
        fi
        
        if [[ "$whatint" = 5 ]]; then
            echo""
            echo "Interface ${intname[4]} has address ${rewq[4]}"
            echo""
            
        fi
        
        if [[ "$whatint" = 6 ]]; then
            echo""
            echo "Interface ${intname[5]} has address ${rewq[5]}"
            echo""
            
        fi
        
        if [[ "$whatint" = 7 ]]; then
            echo""
            echo "Interface ${intname[6]} has address ${rewq[6}"
            echo""
            
        fi
        
        if [ $whatint = 8 ]; then
            gateway=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`
            echo""
            echo "Default gateway is $gateway"
            echo""
        fi
        
        if [[ "$whatint" = 9 ]]; then
            echo""
            while [ $poiu -lt ${#names[@]} ]; do
                    ips[$poiu]=`ifconfig ${names[$poiu]} | grep 'inet addr' |
                                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                                     
                    echo "Interface ${names[$poiu]} has address ${ips[$poiu]}"
                    poiu=$((poiu + 1))
            done
            gateway=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`
                echo "Default gateway is $gateway"
                echo""
        fi
        
        if [ "$whatint" -lt 1 -o "$whatint" -gt 9 ]; then
            error-message
        fi
        
        
done
}

################################################################################

#Commence while loop.

while [ $# -gt 0 ]; do
	case "$1" in
	-h )
		info
		exit 0
		;;
   -r )
   defaultroute="true"
   shift
    ;;
    -i )
   intnum=$2
   howmany=$2
   [ -z "$2" ] && howmany=1 
   shift
    #for all else
    ;;
	* )
		#tell the user what the program expects
		showUsage
		#tell the user what they did wrong
		error-message "Argument '$1' not recognized"
		exit 2
		;;
	#end of case statement	
	* )
		info
		error-message "Argument '$1' not recognized"
		exit 2
		;;
	esac
	shift
done

################################################################################

#Main

intname=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

rewq[0]=`ifconfig ${intname[0]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[1]=`ifconfig ${intname[1]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[2]=`ifconfig ${intname[2]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[3]=`ifconfig ${intname[3]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[4]=`ifconfig ${intname[4]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[5]=`ifconfig ${intname[5]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[6]=`ifconfig ${intname[6]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[7]=`ifconfig ${intname[7]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`
rewq[8]=`ifconfig ${intname[8]} | grep 'inet addr' | sed -e 's/  *inet addr://' | sed -e 's/ .*//'`

for entry in /sys/class/net/*
do
echo "$entry"
done

echo ""

guide
which

################################################################################