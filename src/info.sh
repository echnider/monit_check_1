#!/bin/bash
echo "HOSTNAME = $(hostname)"
sudo timedatectl set-timezone Asia/Novosibirsk
timedatectl | sed -n 's/                //p' | sed -n 's/Time zone:/TIMEZONE =/p' 
echo "USER = $USER"
echo "OS = $(cat /etc/issue)" | sed -n 's/ \\n \\l//p'
echo "DATE = $(date | awk '{print $2,$3,$4,$5}')"
echo "UPTIME = $(uptime -p)" | sed -n 's/up //p'
echo "UPTIME_SEC = $(cat /proc/uptime| awk '{print $1}')"
echo "IP = $(ifconfig | grep -m1 inet | awk '{print $2}')"
echo "MASK = $(ifconfig | grep -m1 inet | awk '{print $4}')"
echo "GATEWAY = $(ip route | grep default | awk '{print $3}')"
var1=$(free -h | awk '/Mem/{printf "%.3f", $2/1024}')
echo "RAM_TOTAL = $var1 GB"
var1=$(free -h | awk '/Mem/{printf "%.3f", $3/1024}')
echo "RAM_USED = $var1 GB"
var1=$(free -h | awk '/Mem/{printf "%.3f", $4/1024}')
echo "RAM_FREE = $var1 GB"
var1=$(df //root | grep dev | awk '{print $2}')
var2=$(bc<<<"scale=2;$var1/1024")
echo "SPACE_ROOT = $var2 MB"
var1=$(df //root | grep dev | awk '{print $3}')
var2=$(bc<<<"scale=2;$var1/1024")
echo "SPACE_ROOT_USED = $var2 MB"
var1=$(df //root | grep dev | awk '{print $4}')
var2=$(bc<<<"scale=2;$var1/1024")
echo "SPACE_ROOT_FREE = $var2 MB"
