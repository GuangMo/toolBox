#!/bin/bash

## Description: parse file for even and odd lines into two files
## Input: file being parsed 
## Outputs: Even_xxxxx   file that stores even number lines 
##          Odd_xxxxx    file that stores odd number lines 

inputFile=$1
lineNum=1

while IFS= read -r line
do
  if [ $((lineNum % 2)) -eq 0 ];
  then
     echo "$line" >> Even_${inputFile}
  else
     echo "$line" >> Odd_${inputFile}
  fi
  let lineNum=$lineNum+1;
done < "$inputFile" 

