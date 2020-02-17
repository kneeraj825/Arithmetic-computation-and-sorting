#!/bin/bash -x
echo Welcome
 
#taking input from user
read -p "Enter the value of a:" firstNumber
read -p "Enter the value of b:" secondNumber
read -p "Enter the value of c:" thirdNumber
#performing  Arithmetic operations on numbers
firstOperation=$(( $firstNumber+$secondNumber*$thirdNumber))
echo "First result is:$firstOperation"
secondOperation=$(( $firstNumber*$secondnumber+$thirdNumber))
echo "Second result is:$secondOperation"
thirdOperation=`echo "scale=2;$thirdNumber+$firstNumber/$secondNumber" | bc`
echo "Third result is:$thirdOperation"
fourthOperation=`echo "scale=2; $firstNumber%$secondNumber+$thirdNumber" | bc`
echo "Fourth result is:$fourthOperation"

#STORING OPERATIONS IN DICTIONARY
declare -A arithmetic
arithmetic[firstOperation]=$firstOperation
arithmetic[secondOperation]=$secondOperation
arithmetic[thirdOperation]=$thirdOperation
arithmetic[fourthOperation]=$fourthOperation
echo ${arithmetic[@]}
