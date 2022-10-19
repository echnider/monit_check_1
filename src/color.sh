#!/bin/bash

array_colors_b=( "\033[107m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m" "\033[0m")
array_colors_f=( "\033[97m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m" "\033[0m")
array_colors_name=( "white" "red" "green" "blue" "purple" "black")
array_colors_default=( "\033[107m" "\033[31m" "\033[42m" "\033[34m")
array_colors_default_name=( "white" "red" "green" "blue")

normal="\033[0m"

if [[ $b1 -le 7 && $b1 -ge 1 ]]
then b1=${array_colors_b[$b1 - 1]}
else
b1=${array_colors_default[0]}
b1_default=1
fi

if [[ $f1 -le 7 && $f1 -ge 1 ]]
then f1=${array_colors_f[$f1 - 1]}
else
f1=${array_colors_default[1]}
f1_default=1
fi

if [[ $b2 -le 7 && $b2 -ge 1 ]]
then b2=${array_colors_b[$b2 - 1]}
else
b2=${array_colors_default[2]}
b2_default=1
fi

if [[ $f2 -le 7 && $f2 -ge 1 ]]
then f2=${array_colors_f[$f2 - 1]}
else
f2=${array_colors_default[3]}
f2_default=1
fi
