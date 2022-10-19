#!/bin/bash
bash .././info.sh
echo ""
echo "Write to file? (y/n)"
read item
case "$item" in
y|Y) echo "Success"
bash .././info.sh>$(date +%d_%m_%y_%H_%M_%S).status
;;
*) echo "File not wrote"
;;
esac
