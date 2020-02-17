#!/bin/bash -x
echo Welcome
 
#taking input from user
read -p "Enter the value of a:" firstNumber
read -p "Enter the value of b:" secondNumber
read -p "Enter the value of c:" thirdNumber
#performing  Arithmetic operations on numbers
operation1=`echo "scale=2;$firstNumber+$secondNumber*$thirdNumber" | bc`
echo "First result is:$operation1"
operation2=`echo "scale=2;$firstNumber*$secondNumber+$thirdNumber" | bc`
echo "Second result is:$operation2"
operation3=`echo "scale=2;$thirdNumber+$firstNumber/$secondNumber" | bc`
echo "Third result is:$operation3"
operation4=`echo "scale=2; $firstNumber%$secondNumber+$thirdNumber" | bc`
echo "Fourth result is:$operation4"

#STORING OPERATIONS IN DICTIONARY
declare -A arithmetic
arithmetic[operation1]=$operation1
arithmetic[operation2]=$operation2
arithmetic[operation3]=$operation3
arithmetic[operation4]=$operation4
echo ${arithmetic[@]}

#storing Dictionary into array
for (( index=0; index<${#arithmetic[@]}; index++ ))
do

   array[index]=${arithmetic[operation$((index+1))]}
done
echo ${array[@]}

#sorting the result in Descending order
for (( firstIndex=0; firstIndex<${#array[@]}; firstIndex++ ))
do
	for (( secondIndex=0; secondIndex<${#array[@]}-1; secondIndex++ ))
	do
		if (($(echo "${array[secondIndex]} < ${array[secondIndex+1]}"| bc -l)))
		then
				temporary=${array[secondIndex]}
				array[secondIndex]=${array[secondIndex+1]}
				array[secondIndex+1]=$temporary
		fi
	done
done
echo "Descending order values is:" ${array[@]}
echo ${#array[@]}

#sorting the result in Ascending order
for (( firstIndex=0; firstIndex<${#array[@]}; firstIndex++ ))
do
   for (( secondIndex=0; secondIndex<${#array[@]}-1; secondIndex++ ))
   do
      if (($(echo "${array[secondIndex]} > ${array[secondIndex+1]}"| bc -l)))
      then
            temporary=${array[secondIndex]}
            array[secondIndex]=${array[secondIndex+1]}
            array[secondIndex+1]=$temporary
      fi
   done
done
echo "Ascending order values is:" ${array[@]}
echo ${#array[@]}


