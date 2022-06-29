#!/bin/bash

#AUTHOR : MOSES CHIOKO
#DATE    : 29 June 2022
#PURPOSE : THIS PROGRAM COMPARE TWO NUMBERS IF ONE NUMBER EQUAL TO OR LESS THAN OR GREATER THAN THE OTHER
function compare()
{   
    #Assigning the values
    num1=$1
    num2=$2
    if [ $num1 -eq $num2 ];then
      echo "The two numbers are equal"
    elif [ $num1 -gt $num2 ];then
      echo "num1 is greater than num2"
    else 
      echo "num1 is less num2"
    fi
}

#Reading two numbers from the user
read -p "Enter the first number:" value1
read -p "Enter the second number:" value2

#Invoking the function
compare $value1 $value2
