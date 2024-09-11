#!/bin/bash

SOURCE_DIR=

# Loop through each photo file in the directory
for PHOTO_FILE in "$SOURCE_DIR"/*.jpg "$SOURCE_DIR"/*.JPG "$SOURCE_DIR"/*.jpeg "$SOURCE_DIR"/*.JPEG "$SOURCE_DIR"/*.heic "$SOURCE_DIR"/*.HEIC "$SOURCE_DIR"/*.png "$SOURCE_DIR"/*.PNG; do

    echo "PHOTO_FILE: $PHOTO_FILE"

    if [ -f "$PHOTO_FILE" ]; then

        PHOTO_TIME=$(jq -r '.photoTakenTime.timestamp' "$PHOTO_FILE.json")
        PHOTO_TIME=$(date -u -r "$PHOTO_TIME" +"%Y:%m:%d %H:%M:%S")

        echo "PHOTO_TIME: $PHOTO_TIME"

        # Adjust the date and time on the photo file
        exiftool -FileModifyDate="$PHOTO_TIME" "$PHOTO_FILE"
        exiftool -FileCreateDate="$PHOTO_TIME" "$PHOTO_FILE"
    else
        echo "Error"
    fi

done
