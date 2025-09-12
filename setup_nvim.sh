#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz

# --- Variables ---
export NVIM_VERSION="v0.11.4"
export NVIM_TAR="nvim-linux-x86_64.tar.gz"
export NVIM_URL="https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/$NVIM_TAR"
export NVIM_DIR="$HOME/.local/nvim"

# --- Step 1: Download and extract Neovim ---
wget $NVIM_URL -O $NVIM_TAR
tar xzf $NVIM_TAR
mkdir -p $NVIM_DIR
mv nvim-linux-x86_64/* $NVIM_DIR

# --- Step 2: Add Neovim to PATH ---
if ! grep -q 'export PATH=$HOME/.local/nvim/bin:$PATH' ~/.bashrc; then
    echo 'export PATH=$HOME/.local/nvim/bin:$PATH' >> ~/.bashrc
    export PATH=$HOME/.local/nvim/bin:$PATH
fi

source ~/.bashrc
# --- Step 3: Verify nvim command ---
nvim --version

# --- Step 4: Install AstroNvim ---
# Backup existing config if any
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
rm -rf ~/.config/nvim/.git

# --- Step 5: Launch nvim to finalize AstroNvim installation ---
nvim

