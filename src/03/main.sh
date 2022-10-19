#!/bin/bash

if [[ -n "$1" ]]
then b1=$1
else b1=7
fi

if [[ -n "$2" ]]
then f1=$2
else f1=7
fi

if [[ -n "$3" ]]
then b2=$3
else b2=7
fi

if [[ -n "$4" ]]
then f2=$4
else f2=7
fi

ECHO_COLORS=".././color.sh"
source "$ECHO_COLORS"

if [[ -n "$1" ]] && [[ -n "$2" ]] && [[ $1 == $2 ]]
then
echo "Color 1 and color 2 are the same. Please, try again."
if [[ -n "$3" ]] && [[ -n "$4" ]] && [[ $3 == $4 ]]
then
echo "Color 3 and color 4 are the same. Please, try again."
fi
echo "Do you want to try again? (y/n)"
read item
case "$item" in
y|Y) exit 0
;;
*) exit 1
;;
esac
fi

if [[ -n "$3" ]] && [[ -n "$4" ]] && [[ $3 == $4 ]]
then
echo "Color 3 and color 4 are the same. Please, try again."
if [[ $1 != $2 ]]
then
echo "Do you want to try again? (y/n)"
read item
case "$item" in
y|Y) exit 0
;;
*) exit 1
;;
esac
fi
fi

bash .././info.sh>file.txt
while read line
do
line_1=$(echo "$line" | awk -F" = " '{print $1}')
line_2=$(echo "$line" | awk -F" = " '{print $2}')
echo -e "$b1$f1$line_1$normal = $b2$f2$line_2$normal"
done < file.txt
rm file.txt
