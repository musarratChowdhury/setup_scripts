#!/bin/bash

set -e

sudo apt update
#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Step 1: Update the system package list
sudo apt update

# Step 2: Install required dependencies for Docker setup
# ca-certificates - Ensure SSL certificates are installed
# curl - Tool to download files from URLs
# gnupg - GnuPG encryption tool (for key management)
# lsb-release - Get Linux distribution info (needed to set Docker repo)
sudo apt install ca-certificates curl gnupg lsb-release -y

# Step 3: Create a directory for Docker's GPG key
sudo mkdir -p /etc/apt/keyrings

# Step 4: Download Docker's GPG key and store it in the created directory
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step 5: Add Docker's official repository to the APT sources list
# This ensures we install Docker from the official repository rather than the default Ubuntu one
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 6: Update the system package list again to include Docker's repository
sudo apt update

# Step 7: Install Docker and related packages
# docker-ce - Docker Community Edition
# docker-ce-cli - Docker command-line interface
# containerd.io - Container runtime for Docker
# docker-buildx-plugin - Multi-platform build plugin for Docker
# docker-compose-plugin - Docker Compose plugin (for managing multi-container apps)
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Step 8: Create a Docker group if it doesn't exist (optional, just in case)
sudo groupadd docker

# Step 9: Add the current user to the Docker group
# This allows you to run Docker commands without `sudo`
sudo usermod -aG docker $USER

# Step 10: Apply the new group by executing newgrp docker (this updates the group for the current session)
# After this, you don't need to log out and back in for the change to take effect
newgrp docker

# Step 11: Test Docker installation by running the hello-world container
docker run hello-world
pt install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
