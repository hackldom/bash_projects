#!/bin/bash
#This script takes in normally two inputs and then outputs all the numbers between the inputs and  depending on  
#what it is it will output a fruit as well
#Created by: Dom Hackl

#this block will execute if the number of inputs is 0
if [ $# -eq 0 ]
	then
		echo  "Enter the first and last integers"
		read a b #reads in the 2 inputs
		echo "the first number is $a and the second is $b"

	for value in $(eval echo {$a..$b}) #for every number between a and b do the following
		do
			if (( $value % 7 == 0 )) #if the number is divisible by 7 and the remainder is 0 then
			then
				echo "$value:orange" #output the number and orange
			fi

			if (( $value % 11 == 0 )) #if the number is divisable by 11  then output the number and banana
			then
				echo "$value:banana"
			fi

			if (( $value % 13 == 0 )) #if the number is divisable by 13 then output the number and pear
                        then
                                echo "$value:pear"

			else #otherwise just return the number
				echo "$value"
			fi

		done
	echo "What's with the fruit obsession?" #after all the numbers were output this is then displayed
	exit 1


elif [ $# -eq 1 ] #this block will execute if the number of inputs is 1
	then
		echo "Please enter the second number"
		read c #reads in the  input which is then stored in the variable c
		echo "the first number is $1 and the second is $c" #outputs the inputs

	for value in $(eval echo {$1..$c}) #outputs the values between the limits

		do
			if (( $value % 7 == 0 )) #if the number is divisible by 7
			then
				echo "$value:orange" #prints orange after the number

			elif (( $value % 11 == 0 )) #if it is divisible by 11
			then
				echo "$value:banana" #prints out the number and banana after

			elif (( $value % 13 == 0 )) #if it is divisible by 13
                        then
                                echo "$value:pear" #outputs the number and pear after it

			else
				echo "$value" #if it is not divisible by any of it then it simply outputs the num
			fi

		done
	echo "What's with the fruit obsession?"

	elif [ $# -gt 2 ] #if there are more than 2 inputs then the lines below will be executed
	then
		echo "You have entered too many parameters, only the first two will be used!" #warning message
		echo "the first number is $1 and the second is $2" #displays the inputs
	for value in $(eval echo {$1..$2}) #for loop between the two inputs but only the first two are used
		do
			if (( $value % 7 == 0 )) #if the number is visible  by 7
			then
				echo "$value:orange" #then the number is printed with orange after

			elif (( $value % 11 == 0 )) #if it is divisible by 11
			then
				echo "$value:banana" #then the nubmer is printed with banana after

			elif (( $value % 13 == 0 )) #if the number is divisible by 13
                	then
                		echo "$value:pear" #then the number is printed with pear after

			else
				echo "$value" #otherise it just prints the number on its own
			fi

		done #end of for loop
	echo "What's with the fruit obsession?"

	elif [ $# -eq 2 ] #if the number of inputs is exactly 2 then the following commands will execute
	then

	for value in $(eval echo {$1..$2}) #for loop between the two inputs
		do
			if (( $value % 7 == 0 )) #if the number is divisible by 7
			then
				echo "$value:orange" #then the number is printed with orange after

			elif (( $value % 11 == 0 )) #if the number is divisible by 11
			then
				echo "$value:banana" #then the number is printed with banana printed after

			elif (( $value % 13 == 0 )) #if the number is divisible by 13 then
                        then
                                echo "$value:pear" #the number is printed with pear printed after it

			else
				echo "$value" #otherwise print the number on its own
			fi

		done #end of for loop
	echo "What's with the fruit obsession?" #this gets output at the end of the loop
fi


