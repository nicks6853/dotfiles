#!/bin/bash

set -e

if command -v nvim >/dev/null 2>&1; then
    echo "neovim already installed."
else
    echo "neovim is not installed, installing..."
    sudo apt-get install --yes neovim
fi

if command rg "test" >/dev/null 2>&1; then
    echo "ripgrep already installed."
else
    echo "ripgrep is not installed, installing..."
    sudo apt-get install --yes ripgrep
fi

if [ -d "${HOME}/.config/nvim" ]; then
    echo "neovim config directory already exists! Aborting to prevent overwriting existing configs."
    exit 1
fi

echo "Copying neovim configurations to ${HOME}/.config/nvim"
cp -r "../files/neovim" "${HOME}/.config/nvim

