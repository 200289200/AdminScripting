#/bin/bash
#This script outputs the following variables
#   Welcome to planet hostname
#   Today is monday

export MYNAME="Shane Araujo"
mytitle="Mr."
myhostname=`hostname`
weekday=`date +%a`

echo "Welcome to planet $myhostname, $mytitle $MYNAME"
echo "Today is $weekday"