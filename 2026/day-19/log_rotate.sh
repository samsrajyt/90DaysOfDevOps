#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage : ./log_rotate.sh <path to log directory>"
	exit 1

fi

if [ -d "$1" ]
then
	echo "Directory exist"

else
	echo "Directory doesnot exist.Please specify correct Directory"
	exit 1
fi

log_dir="$1"

count_of_compressed_file=$(find "$log_dir" -name "*.log" -mtime +7|wc -l 2>/dev/null)

echo "Total no of files compressed are:$count_of_compressed_file"
echo "Compressing Files older than 7 days"
find "$log_dir" -name "*.log" -mtime +7 -exec gzip {} \;

count_of_deleted_files=$(find "$log_dir" -name "*.gz" -mtime +30|wc -l 2>/dev/null)

echo "Deleting zip files older than 30 days"
find "$1" -name "*.gz" -mtime +30 -exec rm {} \;
echo "Count of deleted zip files:$count_of_deleted_files"





