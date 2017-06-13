#!/bin/bash
#####
#   Guang: this tool read a pattern from source file, then loop through target file line by line,
#			  once a similar pattern is found, we output the line from the target file. This is very helpful 
#			  for me, when I need to file similar patterns from two files, but each line contains different 
#          information. 
#
sourceFile="$1"
targetFile="$2"

# reading from sourceFile
while IFS='' read -r line || [[ -n "$line" ]]; do
    parttern=`echo "$line" | awk ' { print $2 }' ` # catch the pattern I am looking for
       while  IFS='' read -r Targetline || [[ -n "$Targetline" ]]; do # reading from file 2
           Targetparttern=`echo "$Targetline" | awk ' { print $2 }' `   # $2, I am looking for the 2nd col in each line
           if [ "$parttern" == "$Targetparttern" ]
           then
              echo "$Targetline"
           fi
       done < "$targetFile"
done < "$sourceFile"
