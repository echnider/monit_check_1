#!/bin/bash

column1_background=$(awk -F= '/column1_background/{print $2}' conf.txt)
column1_font_color=$(awk -F= '/column1_font_color/{print $2}' conf.txt)
column2_background=$(awk -F= '/column2_background/{print $2}' conf.txt)
column2_font_color=$(awk -F= '/column2_font_color/{print $2}' conf.txt)

b1=$column1_background
f1=$column1_font_color
b2=$column2_background
f2=$column2_font_color

ECHO_COLORS=".././color.sh"
source "$ECHO_COLORS"

bash .././info.sh>file.txt
while read line
do
line_1=$(echo "$line" | awk -F" = " '{print $1}')
line_2=$(echo "$line" | awk -F" = " '{print $2}')
echo -e "$b1$f1$line_1$normal = $b2$f2$line_2$normal"
done < file.txt
rm file.txt

echo ""

if [[ $b1_default == 1 ]]
then echo "Column 1 background = default (${array_colors_default_name[0]})"
else echo "Column 1 background = $column1_background (${array_colors_name[$column1_background - 1]})"
fi

if [[ $f1_default == 1 ]]
then echo "Column 1 font color = default (${array_colors_default_name[1]})"
else echo "Column 1 font color = $column1_font_color (${array_colors_name[$column1_font_color - 1]})"
fi

if [[ $b2_default == 1 ]]
then echo "Column 2 background = default (${array_colors_default_name[2]})"
else echo "Column 2 background = $column2_background (${array_colors_name[$column2_background - 1]})"
fi

if [[ $f2_default == 1 ]]
then echo "Column 2 font color = default (${array_colors_default_name[3]})"
else echo "Column 2 font color = $column2_font_color (${array_colors_name[$column2_font_color - 1]})"
fi
