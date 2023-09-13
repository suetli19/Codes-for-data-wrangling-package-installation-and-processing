#!/bin/bash

# Source directory containing the folders with tar.gz files
source_dir="./output/"

# Destination parent directory where the output will be saved
destination_parent_dir="./output/merged/"

# Loop through the folders in the source directory
for folder in "$source_dir"*/; do
    folder_name=$(basename "$folder")
    output_dir="$destination_parent_dir$folder_name-renamed/"

    # Create the output directory if it does not exist
    mkdir -p "$output_dir"

    # Unzip and rename the contents
    for tarball in "$folder"*.tar.gz; do
        tar -xzf "$tarball" -C "$output_dir"
    done
done
