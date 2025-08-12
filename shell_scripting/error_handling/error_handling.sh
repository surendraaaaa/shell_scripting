#!/bin/bash

#this script is for error handling using IF and THEN.

create_directory() {

	mkdir demo

}

if ! create_directory; then
	echo "code is being exited, you have already created directory"
	exit 1
fi

create_directory

echo "you have created the directory"
