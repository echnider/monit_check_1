#!/bin/bash
if [[ -n "$1" ]] && [[ $# -eq 1 ]]
then 
if [[ "$1" =~ /$ ]]
then ./info.sh $1
else
echo "Use \"/\" in the end"
fi
else
echo "Only one parameter must be specified"
fi