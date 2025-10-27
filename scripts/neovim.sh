#!/bin/bash

set -e

ARDUINO_LANGUAGE_SERVER_VERSION="0.7.7"

PACKAGES_TO_INSTALL=()
PACKAGES=("python3-pynvim" "ripgrep" "golang" "clangd")

# Check which packages are not installed yet
for package in "${PACKAGES[@]}"; do
    if dpkg -s "${packages}" &>/dev/null; then
        echo "${package} is missing."
    else
        echo "${package} is installed"
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

if [ -d "${HOME}/.config/nvim" ]; then
    echo "neovim config directory already exists! Aborting to prevent overwriting existing configs."
    exit 1
fi

echo "Copying neovim configurations to ${HOME}/.config/nvim"
cp -r ../files/nvim/* "${HOME}/.config/nvim/"

