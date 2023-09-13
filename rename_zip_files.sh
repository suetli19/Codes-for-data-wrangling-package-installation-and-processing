#!/bin/bash

# Create a directory to store the extracted files
mkdir -p ./output

# Loop through each ZIP file in the current directory
for zipfile in *.zip; do
    # Create a directory with a unique name based on the ZIP file name (without the extension)
    dirname="${zipfile%.zip}"
    mkdir -p "./output/$dirname"

    # Extract the contents of the ZIP file to the newly created directory
    unzip "$zipfile" -d "./output/$dirname"
done
