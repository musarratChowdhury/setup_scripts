#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
./nvim-linux-x86_64/bin/nvim

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
