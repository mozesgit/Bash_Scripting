#!/bin/bash

#AUTHOR : MOSES CHIOKO
#DATE   : 29 June 2022
#PURPOSE:THIS PROGRAM TEST WHETHER THE GIVEN NUMBER IS EVEN OR ODD
function even_odd()
{
    #Taking input from the user
    read -p "Enter the number:" number

    if [ $((number%2)) -eq 0 ];then
      echo "The number is even"
    else
      echo "The number is odd"
    fi
}
even_odd

