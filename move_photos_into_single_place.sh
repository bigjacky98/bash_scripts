#!/bin/bash

# Define the source directory and destination directory
SOURCE_DIR=""
DEST_DIR=""

# Create the destination directory if it does not exist
mkdir -p "$DEST_DIR"

# Find and move all image files to the destination directory
find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.heic" \) -exec mv {} "$DEST_DIR" \;

echo "All photos have been moved to $DEST_DIR."
