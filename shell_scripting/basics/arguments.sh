#!/bin bash

<< comment
These are scripts for arguments
comment

#script 1

echo "characters in my movie are: $1 and $2"

#script 2 

echo "chatacters in the movie are $1 $2 and $3"

echo "you finished making your cast on $(date)"

#script 3 USER_ADD

sudo useradd -m $1 $2 $3 $4

echo "you have successfully added all the users"
