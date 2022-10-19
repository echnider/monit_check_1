#!/bin/bash
if ! [[ "$1" =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] && ! [[ "$2" =~ . ]]
then
echo "$1"
else
echo "incorrect input"
fi