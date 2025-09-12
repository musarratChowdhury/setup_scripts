#!/bin/bash
set -e

# --- Variables ---
OMPOSH_BIN="posh-linux-amd64"
OMPOSH_URL="https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/$OMPOSH_BIN"
INSTALL_DIR="$HOME/.local/bin"
THEME_DIR="$HOME/.poshthemes"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
SHELL_RC="$HOME/.bashrc"   # change to ~/.zshrc if using Zsh

# --- Step 1: Install Oh My Posh ---
mkdir -p "$INSTALL_DIR"
wget -q "$OMPOSH_URL" -O "$INSTALL_DIR/oh-my-posh"
chmod +x "$INSTALL_DIR/oh-my-posh"

# --- Step 2: Add to PATH if not already present ---
if ! grep -q 'export PATH=$HOME/.local/bin:$PATH' "$SHELL_RC"; then
    echo 'export PATH=$HOME/.local/bin:$PATH' >> "$SHELL_RC"
    export PATH=$HOME/.local/bin:$PATH
fi

# --- Step 3: Download Oh My Posh themes ---
mkdir -p "$THEME_DIR"
wget -q https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /tmp/omp-themes.zip
unzip -o /tmp/omp-themes.zip -d "$THEME_DIR"
rm /tmp/omp-themes.zip

# --- Step 4: Download and install Nerd Font ---
mkdir -p "$HOME/.local/share/fonts"
wget -q "$NERD_FONT_URL" -O /tmp/nerd-font.zip
unzip -o /tmp/nerd-font.zip -d "$HOME/.local/share/fonts"
rm /tmp/nerd-font.zip
fc-cache -fv

# --- Step 5: Configure shell to use Oh My Posh ---
if ! grep -q 'oh-my-posh init' "$SHELL_RC"; then
    echo 'eval "$(oh-my-posh init bash --config ~/.poshthemes/jandedobbeleer.omp.json)"' >> "$SHELL_RC"
fi

# --- Step 6: Done ---
echo "Installation complete! Restart your terminal or run 'source $SHELL_RC'."

