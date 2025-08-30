#!/bin/bash

sum=0

# Check the valid number of input grade provided
if [[ $# -eq 0 ]]; then
	echo "Please provide valid grades"
	exit 1
fi

# for loop to calculate sum of grades
for GRADE in "$@"; do
	sum=$((sum+GRADE))
done

# calculate average grade of the student
avg=$((sum/$#))
echo "Average Grades are $avg"

# display letter grade based on average grade
if [[ $avg -lt 60 ]]; then
	echo "your grade is F, Work ON YOURSELF!!"
elif [[ $avg -le 69 && $avg -ge 60 ]]; then
	echo "your grade is D, Work ON YOURSELF A LITTLE!!"
elif [[ $avg -le 79 && $avg -ge 70 ]]; then
        echo "your grade is C, YOU DID GOOD!!"
elif [[ $avg -le 89 && $avg -ge 80 ]]; then
        echo "your grade is B, YOU ARE SMART!!"
elif [[ $avg -le 100 && $avg -ge 90 ]]; then
        echo "your grade is A, BINGO!!"
else
	echo "Invalid Input"
fi	


