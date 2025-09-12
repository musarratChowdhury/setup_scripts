#!/bin/bash

##install nodejs

##install dotnet

##install angular cli

##install python
#!/bin/bash

set -e

echo "Updating system..."
sudo apt update && sudo apt upgrade -y

## Install Node.js (LTS)
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v

## Install .NET SDK
echo "Installing .NET SDK..."
wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt update
sudo apt install -y dotnet-sdk-8.0
dotnet --version

## Install Angular CLI
echo "Installing Angular CLI..."
sudo npm install -g @angular/cli
ng version

## Install Python
echo "Installing Python..."
sudo apt install -y python3 python3-pip
python3 --version
pip3 --version

## Install Go
echo "Installing Go..."
GO_VERSION="1.23.0"
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc
go version

echo "All installations completed successfully!"

##install go
