#!/bin/bash
#Perform each of the 5 arithmetic operations on the numbers, and display the results in a user-friendly way.

#echo 32
#echo $(( 3 + 4 ))
#echo "5 divided by 2 leaves a remainder of $(( 5 % 2 ))"

read -p "Give me a number: " firstnum
read -p "Give me a second number: " secondnum

sum=$(( firstnum + secondnum ))

echo "$firstnum plus $secondnum equals $(( firstnum + secondnum ))"

echo "$firstnum minus $secondnum equals $(( firstnum - secondnum ))"

echo "$firstnum times $secondnum equals $(( firstnum * secondnum ))"

echo "$firstnum divided by $secondnum equals $(( firstnum / secondnum ))"

echo "$firstnum divided by $secondnum leaves a remainder of $(( firstnum % secondnum ))"