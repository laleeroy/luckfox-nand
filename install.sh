#!/bin/bash

# Define variables
TEMP_DIR="temp_extracted"
INSTALL_DIR="PPPwn-Luckfox"

# Get the latest release URL
latest_release_url=$(curl -s https://api.github.com/repos/0x1iii1ii/PPPwn-Luckfox/releases/latest | grep "zipball_url" | cut -d '"' -f 4)

# Download the latest release zip file
curl -L -o pppwn-latest.zip "$latest_release_url"

# Unzip the downloaded file into a temporary directory
unzip pppwn-latest.zip -d "$TEMP_DIR"

# Create the target directory if it does not exist
mkdir -p "$INSTALL_DIR"

# Move the contents out of the nested directory to the target directory
mv "$TEMP_DIR"/*/* "$INSTALL_DIR"

# Clean up temporary files and directories
rm -rf "$TEMP_DIR" pppwn-latest.zip

# Change to the installation directory
cd "$INSTALL_DIR"

# Remove unnecessary files
rm -rf images README.md

# Clear the terminal screen
clear

# Run the installation script
if [ -f install_NAND.sh ]; then
    bash install_NAND.sh
else
    echo "install_NAND.sh not found. Exiting."
    exit 1
fi
