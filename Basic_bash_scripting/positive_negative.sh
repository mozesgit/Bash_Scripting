#!/bin/bash

# AUTHOR   : MOZES CHIOKO
# DATE     : 29 June 2022
# PURPOSE  : THIS PROGRAM TEST WHETHER THE GIVEN VALUE IS POSITIVE OR NEGATIVE

function positive_negative()
{
    #Reading the the number
    read -p "Enter the number:" number

    if [ $number -gt 0 ];then
      echo "The number is positive"
    else 
      echo "The number is negative"
    fi
}
positive_negative
