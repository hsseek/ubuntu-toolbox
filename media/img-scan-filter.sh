#!/bin/bash

# Create a directory to store processed images
mkdir -p processed

# Loop through all JPG and PNG files in the current directory
for img in *.jpg *.png; do
    # Ensure the file exists (in case no matching files are found)
    [ -f "$img" ] || continue

    # Apply brightness and contrast adjustment
    convert "$img" -brightness-contrast -5x100 "processed/$img"

    echo "Processed: $img"
done

echo "All images processed and saved in the 'processed' folder."

