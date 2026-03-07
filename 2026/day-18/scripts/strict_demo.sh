#!/bin/bash
set -euo pipefail

# 1. Intentionally use an undefined variable to test '-u'
# If you uncomment the line below, the script will crash immediately.
#echo "Starting backup for user: $USER_NAME_TYPO"


SOURCE_FILE="important_data.txt"
DEST_DIR="backup_folder"

echo "Creating backup directory..."
mkdir -p "$DEST_DIR"

echo "Writing data to $SOURCE_FILE..."
echo "This is some very important info." > "$SOURCE_FILE"

echo "Moving file to backup..."
#echo "Removing $SOURCE_FILE"
#rm $SOURCE_FILE
# 2. Test '-e' by attempting to move a file that doesn't exist
mv "$SOURCE_FILE" "$DEST_DIR/"

echo "Checking backup integrity..."
# 3. Test '-o pipefail' 
# This pipeline will fail if the 'grep' finds nothing.
#cat "$DEST_DIR/$SOURCE_FILE" | grep "banana"

#echo "Backup successful!"

echo "Piped command"
grep "banana" "$DEST_DIR/$SOURCE_FILE" || grep "important" "$DEST_DIR/$SOURCE_FILE"
