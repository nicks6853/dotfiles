#!/bin/bash

set -e

if [ "$(uname -s)" != "Darwin" ]; then
    echo "Not running on MacOS, exiting!"
fi

brew cask install alacritty
cp ../../files/macos/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo "Alacritty Configured"

