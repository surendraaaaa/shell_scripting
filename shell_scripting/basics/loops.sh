#!/bin/bash

<< comment 
Two types of loops for and while. let's learn!
comment

# FOR LOOP

for (( num=1; num<=5; num++ ));
do
	mkdir "demo$num"
done

# FOR LOOP USING ARGUMENTS

<< task
$1 is directory name
$2 is start value for your directory creation
$3 id end value for your directory creation
task


for (( num=$2; num<=$3; num++ ));
do
        mkdir "$1$num"
done

# WHILE LOOP

i=0

while [[ $i -le 5 ]];
do
	echo "your are champ!"
	i=$i+1
done


