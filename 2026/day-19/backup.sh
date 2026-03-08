#!/bin/bash

if [ $# -eq 0 ]

then
	echo "Usage: ./backup.sh <src dir> <bkp dir>"
	exit 1
fi

if [ -d "$1" ]
then
	echo "Directory Check validates, Proceeding further"

else
	echo "Please specify directory that exists"
	exit 1
fi

SRC_DIR="$1"
BKP_DIR="$2"
Timestamp=$(date +%Y-%m-%d)
echo "Archiving files......"
tar -cvf "$BKP_DIR"/backup-"$Timestamp".tar.gz "$SRC_DIR" 2>/dev/null
if [ $? -eq 0 ]
then 
	echo "Archived Successfully"
	du -sh "$BKP_DIR"/backup*


else
	echo "Archive Failure"
fi

backup_files_list=($(ls -t "$BKP_DIR"/backup*))

for backup in "${backup_files_list[@]:14}"; do 
		echo "Removing Older files"
		rm $backup



	done

