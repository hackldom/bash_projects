#!/bin/bash
#File name: cpc.sh
#Created by: Dom Hackl

if [ ! -d "backups" ]; then #This checks if the backups folder exists
	mkdir backups       #This creates the backup folder if it does not already exist
fi
if [ $# -eq 3 ]; then #This checks the number of arguments are equal to 3
	if [ $1 = "-z" ]; then  #This checks if the first input is equal to -z in order to zip or unzip files.
		if [ -f "$2" ]; then  # This checks if the sourcefile exists in order to run the code
			if [ -d "$3" ]; then # This checks if the target directory exists in order to run the code
				if [ ${2##*.} = "gz" ]; then #This checks if the sourcefile type is equal to 'gz', and therefore needs to be unzipped. 
					mv $2 $3
					gunzip $3/$2 
				else #If the sourcefile is NOT a 'gz', the command with zip the file to the directory instead.
					gzip $2
					mv $2.gz $3
				fi
			else #This runs if the target directory does not exist. This will create an error message, and the option to create the target directory requested.
				echo "Target directory does not exist! Create directory $3?"
				read answer
				if [ answer="yes" ]; then
					mkdir $3
					gzip $2
					mv $2.gz $3
				fi
			fi 
		else #This prints out the error message that the sourcefile requested does not exist.
			echo "Sourcefile $2 doesn't exist"
		fi
	elif [ $1 = "-c" ]; then #This checks if the first argument is '-c' in order to copy files.
		if [ -f "$2" ]; then #This checks if the sourcefile exists.
			if [ -d "$3" ]; then #This checks if the directory exists.
				cp $2 $3   #This runs if all criteria of the if statements are met, and therefore copies the sourcefile to the target directory.
			else  #If the target directory does not exist, it will output an error message and provide the option to create the target directory requested.
				echo "Target directory does not exist! Create directory $3?"
				read answer
				if [ answer="yes" ]; then
					mkdir $3
					cp $2 $3
				fi
			fi
		else #This prints out the error message that the sourcefile does not exist.
			echo "Sourcefile $2 doesn't exist"
		fi
	else #This prints an error message if the first input is neither '-c' or '-z' as it needs to know in order to perform a copy or zip/unzipping.
		echo "The first argument has to be -c or -z"
	fi
else #This prints the error message if the number of arguments is incorrected, and prints out the correct format for the users to follow.
	echo "Error: Incorrect number of arguments"
	echo "Usage: cpc [-cz] [source-file] [target-directory]"
fi

