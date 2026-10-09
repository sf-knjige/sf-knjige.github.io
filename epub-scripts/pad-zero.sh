#!/bin/bash
# credit: LinuxVox.com
# From https://linuxvox.com/blog/linux-shell-script-to-add-leading-zeros-to-file-names/
# only the variables have been changed to match the purpose of this here
# no commercial use as stated in https://linuxvox.com/terms/

# Purpose: Rename files with numeric suffixes to zero-padded format
# Example: "image1.jpg" → "image0001.jpg"
# Usage: ./rename_with_zeros.sh
 
# --------------------------
# Customize these variables!
# --------------------------
BASE_NAME="p"   # Static part of the filename (e.g., "image" for "image1.jpg")
EXTENSION="html"     # File extension (without the dot)
DIGITS=4            # Target width (e.g., 4 → 0001, 0010, 0100, 1000)
DRY_RUN="false"     # Set to "true" to preview changes without renaming
# --------------------------
 
# Check if target files exist
if ! ls "${BASE_NAME}"*."${EXTENSION}" 1> /dev/null 2>&1; then
  echo "Error: No files found matching '${BASE_NAME}*.${EXTENSION}'"
  exit 1
fi
 
# Loop through matching files
for file in "${BASE_NAME}"*."${EXTENSION}"; do
  # Extract numeric suffix using regex
  number=$(echo "$file" | sed -E "s/^${BASE_NAME}([0-9]+)\.${EXTENSION}$/\1/")
 
  # Skip files with no numeric suffix (e.g., "image.jpg" or "imageabc.jpg")
  if [[ -z "$number" ]]; then
    echo "Skipping $file: No numeric suffix found."
    continue
  fi
 
  # Pad number with leading zeros
  # 10# forces base-10 to avoid octal interpretation (e.g., "050" → 50, not 40)
  padded_number=$(printf "%0${DIGITS}d" "$((10#$number))")
 
  # Generate new filename
  new_file="${BASE_NAME}${padded_number}.${EXTENSION}"
 
  # Preview or rename
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "Would rename: '$file' -> '$new_file'"
  else
    mv -n -v "$file" "$new_file"
  fi
done
 
if [[ "$DRY_RUN" == "true" ]]; then
  echo "Dry run complete. No files were renamed."
else
  echo "Renaming complete!"
fi
