#!/bin/bash

# AUTHOR : MOSES CHIOKO
# DATE   : 29 June 2022
# PURPOSE: THIS PROGRAM FINDS THE LARGEST NUMBER READ FROM THE USER

function max()
{
    num1=$1
    num2=$2
    num3=$3
    if [ $num1 -gt $num2 -a $num1 -gt $num3 ];then
      echo "The greatest number is num1 = $num1"
    elif [ $num2 -gt $num3 ];then
      echo "Th greatest number is num2 = $num2"
    else
      echo "The greatest number is num3 = $num3"
    fi
}
#Reading the number from the user
read -p "Enter the first number:" value1
read -p "Enter the second number:" value2
read -p "Enter the third number:" value3
max $value1 $value2 $value3  
