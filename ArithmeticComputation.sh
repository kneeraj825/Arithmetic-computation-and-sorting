#!/bin/bash -x
echo Welcome
 
#taking input from user
read -p "Enter the value of a:" firstNumber
read -p "Enter the value of b:" secondNumber
read -p "Enter the value of c:" thirdNumber
#performing first Arithmetic operations on numbers
firstOperation=$(( $firstNumber+$secondNumber*$thirdNumber))
echo "First result is:$firstOperation"
#performing second Arithmetic operations on numbers
secondOperation=$(( $firstNumber*$secondnumber+$thirdNumber))
echo "Second result is:$secondOperation"
