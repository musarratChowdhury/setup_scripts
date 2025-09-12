#!/bin/bash

# Update package lists
echo "Updating package list..."
sudo apt update

# Step 1: Install Git
echo "Installing Git..."
sudo apt install git -y

# Check the installed Git version
echo "Checking Git version..."
git --version

# Step 2: Install OpenSSH client (if not already installed)
echo "Installing OpenSSH client..."
sudo apt install openssh-client -y

# Check the installed SSH version
echo "Checking SSH version..."
ssh -V

# Step 3: Generate SSH key for GitHub (using provided email address)
echo "Generating SSH key..."
ssh-keygen -t rsa -b 4096 -C "muhitlopez143@gmail.com"

# Step 4: Start the SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

# Step 5: Copy SSH public key to clipboard
echo "Copying SSH public key to clipboard..."
if command -v xclip &> /dev/null
then
    # If xclip is installed (commonly for Linux)
    cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
    echo "SSH public key copied to clipboard using xclip."
elif command -v pbcopy &> /dev/null
then
    # If pbcopy is installed (macOS)
    cat ~/.ssh/id_rsa.pub | pbcopy
    echo "SSH public key copied to clipboard using pbcopy."
else
    echo "Neither xclip nor pbcopy found. Please copy the following key manually:"
    cat ~/.ssh/id_rsa.pub
fi

# Step 6: Add Git config details (user.name and user.email)
echo "Configuring Git user details..."
git config --global user.name "musarratchowdhury"
git config --global user.email "muhitlopez143@gmail.com"

# Step 7: Test SSH connection with GitHub
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

# Final message
echo "Git and SSH setup completed. Please go to your GitHub settings to add the copied SSH key."

