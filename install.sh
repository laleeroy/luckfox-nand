#!/bin/bash

# Get the latest release URL
latest_release_url=$(curl -s https://api.github.com/repos/0x1iii1ii/PPPwn-Luckfox/releases/latest | grep "zipball_url" | cut -d '"' -f 4)

# Download the latest release zip file
curl -L -o pppwn-latest.zip "$latest_release_url"

# Unzip the downloaded file into a temporary directory
unzip pppwn-latest.zip -d temp_extracted

# Move the contents out of the nested directory to the root
mv temp_extracted/*/* ./

# Remove unnecessary directories and files after extraction
rm -rf temp_extracted pppwn-latest.zip images README.md
clear

# Run the installation script
bash install_NAND.sh
