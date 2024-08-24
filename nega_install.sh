#!/bin/bash

# Inform the user that this script is only for Ubuntu
echo "==============================================="
echo " THIS SCRIPT IS ONLY FOR UBUNTU OS (Ubuntu 22.04.4 LTS)"
echo " Ensure that you are running this script on Ubuntu 22.04.4 LTS."
echo "==============================================="
echo ""

# Pause before starting the first step
read -p "Press Enter to begin the installation process..."

# Step 1: Install additional required packages
echo "==============================================="
echo "Step 1: Installing required packages..."
echo "==============================================="

sudo apt-get update && sudo apt-get install -y \
  libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 libxtst6 libnss3 \
  libxrandr2 libatk1.0-0 libcups2 libpangocairo-1.0-0 libatk-bridge2.0-0 libdrm2 \
  libgbm1 libasound2 libxshmfence1 libwayland-server0 libwayland-egl1 libdbus-1-3 \
  libgdk-pixbuf2.0-0 libgtk-3-0 tk-dev libncurses5-dev libncursesw5-dev pandoc unzip

# Step 2: Download and Install Pandoc
echo "==============================================="
echo "Step 2: Downloading and installing Pandoc..."
echo "==============================================="

read -p "Press Enter to begin the installation process..."

wget https://github.com/jgm/pandoc/releases/download/3.2/pandoc-3.2-linux-amd64.tar.gz
sudo tar -xzf pandoc-3.2-linux-amd64.tar.gz
sudo mv pandoc-3.2/bin/pandoc /usr/bin/pandoc
rm -r pandoc-3.2 pandoc-3.2-linux-amd64.tar.gz

read -p "Step 2 complete. Press Enter to proceed to Step 3..."

# Step 3: Download Installer Zip File
echo "==============================================="
echo "Step 3: Downloading Installer Zip File..."
echo "==============================================="

# Check if the install-LINUX.zip file exists
if [ -f "install-LINUX.zip" ]; then
  echo "File install-LINUX.zip exists. Deleting it..."
  rm install-LINUX.zip
  echo "install-LINUX.zip has been deleted."
fi

# Check if the NEGAX_SUPREME_1.5.12.zip file exists
if [ -f "NEGAX_SUPREME_1.5.12.zip" ]; then
  echo "File NEGAX_SUPREME_1.5.12.zip exists. Deleting it..."
  rm NEGAX_SUPREME_1.5.12.zip
  rm -r ./nega
  echo "NEGAX_SUPREME_1.5.12.zip has been deleted."
fi

# Check if the nega_install file exists
if [ -f "nega_install" ]; then
  echo "File nega_install exists. Deleting it..."
  rm ./nega_install
  echo "nega_install has been deleted."
fi

# Download the install-LINUX.zip file
curl -O https://raw.githubusercontent.com/NEGAX-ADMIN/jsa/main/install-LINUX.zip

chmod +x ./install-LINUX.zip
sudo unzip install-LINUX.zip

read -p "Step 3 complete. Press Enter to proceed to Step 4..."

# Step 4: Set permissions for the installer
echo "==============================================="
echo "Step 4: Setting permissions for the installer..."
echo "==============================================="
chmod +x ./nega_install

# Step 5: Run the installer
echo "==============================================="
echo "Step 5: Running the installer..."
echo "==============================================="
echo "NOTE: HWID varies every time on some VPS."
echo "Please double-check to confirm if that is what is whitelisted in the bot before you proceed to the next step."

./nega_install

read -p "Step 5 complete. Press Enter to proceed to Step 6..."

# Step 6: Enter your credentials and setup
echo "==============================================="
echo "Step 6: Enter your credentials"
echo "==============================================="
echo "Please enter your License Key, License ID, and HWID as required by the bot, and press Enter."
echo "Once the download is complete, the script will extract and set up the application."

# Step 7: Check for template_folder and sender_output directories
echo "==============================================="
echo "Step 7: Checking for existing directories..."
echo "==============================================="

if [ -d "template_folder" ] && [ -d "sender_output" ]; then
  echo "Both template_folder and sender_output directories exist."
  echo "Only extracting nega from the ZIP file..."
  sudo unzip -j NEGAX_SUPREME_1.5.12.zip "nega" -d .

else
  echo "One or both of the required directories are missing."
  echo "Performing a full extraction..."
  sudo unzip NEGAX_SUPREME_1.5.12.zip
fi

# Make the nega script executable
chmod +x ./nega

read -p "Step 7 complete. Press Enter to finish the installation..."

# Final step: Inform the user of the completion
echo "==============================================="
echo "Installation complete."
echo "If you don't have a license, purchase directly from the admin or the bot."
echo "To run the application, use './nega' or 'nega'."
echo "Always, to upload a file, start by typing '/root/NEGAX/'"
echo "The rest of the files or directories will show up. Use the arrow keys (⬆⬇) to select."
echo "CTRL + D OR CTRL + C to cancel an operation in the sender."
echo "==============================================="
echo " NEGA WISHES YOU GOOD LUCK "
