#!/bin/bash

set -e

ARDUINO_LANGUAGE_SERVER_VERSION="0.7.7"

PACKAGES_TO_INSTALL=()
PACKAGES=("python3-pynvim" "ripgrep" "golang" "clangd")

# Check which packages are not installed yet
for package in "${PACKAGES[@]}"; do
    if dpkg -s "${package}" &>/dev/null; then
        echo "${package} is installed"
    else
        echo "${package} is missing."
        PACKAGES_TO_INSTALL+=("${package}")
    fi
done

# If any package is missing, install it
if [[ "${#PACKAGES_TO_INSTALL[@]}" -ne 0 ]]; then
    echo "The following required packages are not installed."
    echo "${PACKAGES_TO_INSTALL[@]}"
    echo "Installing..."
    sudo apt-get install --yes "${PACKAGES_TO_INSTALL[@]}"
else
    echo "All required packages are installed."
fi

# Install the arduino-language-server (configured in neovim)
go install "github.com/arduino/arduino-language-server@${ARDUINO_LANGUAGE_SERVER_VERSION}"

# Install treesitter-cli
npm install -g tree-sitter-cli

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ -d "${HOME}/.config/nvim" ]; then
    echo "neovim config directory already exists! Aborting to prevent overwriting existing configs."
    exit 1
fi

echo "Copying neovim configurations to ${HOME}/.config/nvim"
mkdir -p "${HOME}/.config/nvim"
cp -r ../files/nvim/* "${HOME}/.config/nvim/"

