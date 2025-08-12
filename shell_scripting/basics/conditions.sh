#!/bin/bash

#script 1

<< disclaimer

This is for your loyalty test

!!This is just for infotainment purpose!!

disclaimer

read -p "Enter the name of girl you think first in the morning: " girl
read -p "Enter the name of your girlfriend: " girlfriend
read -p "love for your girl %:" love

if [ "$girl" = "$girlfriend" ];

then
	echo "You are loyal man"

elif [ "$love" -ge 90 ];
then
	echo "you are near to be a loyal man!"

else
	echo "work on your loyalty, you are not loyal at all"

fi
