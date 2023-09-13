#!/bin/bash

# Set the path to the main directory
main_dir="./output/merged/"

# Create the new destination directory where you want to move the files
new_destination_dir="./output/merged/taxa_merged/"

#!/bin/bash

# Set the path to the main directory
main_dir="./output/merged/"

# Create the new destination directory where you want to move the files
new_destination_dir="./output/merged/edge_merged/"

# Create the new destination directory if it doesn't exist
mkdir -p "$new_destination_dir"

# Specify the certain string you want to search for
certain_string="output.bacteria.edge_tally"

# Initialize a sequence counter for renaming the files
sequence=1

# Loop through each subdirectory
find "$main_dir" -type f -name "*$certain_string*" -print0 | while IFS= read -r -d '' file; do
  # Get the file name without the path
  file_name=$(basename "$file")
  
  # Construct the new file name with the sequence number
  new_file_name="${new_destination_dir}/nicu_edge${sequence}.txt"
  
  # Move and rename the file to the new destination directory
  cp "$file" "$new_file_name"
  
  # Increment the sequence counter for the next file renaming
  ((sequence++))
done

echo "Files moved and renamed successfully."
