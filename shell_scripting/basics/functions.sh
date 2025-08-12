#!/bin/bash


<< disclaimer

This is for your loyalty test

!!This is just for infotainment purpose!!

disclaimer

function is_loyal() {

read -p "Enter the name of girl you think first in the morning: " girl
read -p "Enter the name of your girlfriend: " girlfriend
read -p "love for your girl %:" love

if [ "$girl" = "$girlfriend" ];

then
        echo "$1 is loyal man"

elif [ "$love" -ge 90 ];
then
        echo "$1 is near to be a loyal man!"

else
        echo "work on your loyalty, $1 is not loyal at all"

fi
}

is_loyal Ashu
