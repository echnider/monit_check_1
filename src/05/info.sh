#!/bin/bash
START=$(date +%s)
#1 Общее число папок, включая вложенные
echo "Total number of folders (including all nested ones) = $(sudo ls -lR $1| grep ^d | wc -l )"

#2 Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"

sudo du -h $1 | sort -hr | awk '{print $2", "$1}' > file.txt

n=0
while read line;
do
n=$((n+1))

if [[ $n -eq 0 ]]
then continue
fi

if [[ $n -gt 0 ]] && [[ $n -le 5 ]]
then 
echo "$n - $line"
fi

if [[ $n -gt 5 ]]
then break
fi

done < file.txt
rm file.txt

#3 Общее число файлов
echo "Total number of files = $(ls -l $1| grep "^-"  | wc -l)"

#4 Число конфигурационных файлов (с расширением .conf), текстовых файлов, ...
echo "Number of:  "
echo "Configuration files (with the .conf extension) = $(ls -l $1 | grep "\.conf$" | wc -l)"
echo "Text files = $(ls -l $1 | grep "\.txt$" | wc -l)"
echo "Executable files = $(ls -l $1 | grep "\.sh$" | wc -l)"
echo "Log files (with the extension .log) = $(ls -l $1 | grep "\.log$" | wc -l)"
echo "Archive files = $(ls -l $1 | grep '\.(zip\|gz\|rar)' | wc -l)"
echo "Symbolic links = $(ls -la $1 | grep ^l | wc -l)" 

#5 Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "

find $1 -type f -exec du -Sh {} + | sort -rh > file.txt
n=1
while read line;
do

if [[ $n -gt 0 ]] && [[ $n -le 10 ]]
then 
name=$(echo $line | awk '{print $2}' )
echo -n "$n - $name"
echo -n "$(echo $line | awk '{print ", "$1", "}')"
echo "${name##*.}"
fi

if [[ $n -gt 10 ]]
then break
fi

n=$((n+1))

done < file.txt
rm file.txt

#6 Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) "

find /home/student/ -type f -perm /a=x -exec du -Sh {} + | sort -rh > file.txt
n=1
while read line;
do

if [[ $n -gt 0 ]] && [[ $n -le 10 ]]
then 
name=$(echo $line | awk '{print $2}' )
echo -n "$n - $name"
echo -n "$(echo $line | awk '{print ", "$1", "}')"
echo "$(md5sum $name | awk '{print $1}')"
fi

if [[ $n -gt 10 ]]
then break
fi

n=$((n+1))

done < file.txt
rm file.txt

#7 
END=$(date +%s)
echo "Script execution time (in seconds) = $(( $END - $START ))"