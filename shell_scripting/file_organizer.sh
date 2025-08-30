#!/bin/bash

FILE_DIR="$HOME/organized_files"
DOWN_DIR="$HOME/downloads"
LOG_FILE="$HOME/organized_files/file_organizer.log"

# Make directroy if not available
mkdir -p "$FILE_DIR"

#for loop 
for FILE in "$DOWN_DIR"/*.txt; do
	#check if FILE exist or not
	if [[ -f "$FILE" ]]; then

		#extracting filebasename 
		FILENAME=$(basename "$FILE" .txt)

		#Timestamp for renaming the file
		TIME=$(date +%Y%m%d_%H%M%S)

		# new file name
		NEW_FILENAME="${FILENAME}_${TIME}.txt"

		# moving file
		mv "$FILE" "$FILE_DIR"/"$NEW_FILENAME"

		echo "Moved: $FILE -> "$FILE_DIR"/"$NEW_FILENAME" at $TIME" >> "$LOG_FILE"
		sleep 3
	else
		#if file does not available show erroe log
		echo "ERROR⚠️: No .txt file found in the $DOWN_DIR" >> "$LOG_FILE"
		exit 1
	fi
done
