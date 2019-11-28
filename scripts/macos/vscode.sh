#!/bin/bash

set -e

if [ "$(uname -s)" != "Darwin" ]; then
    echo "Not running on MacOS, exiting!"
fi

brew install wget
wget -O "$HOME/Downloads/VSCode.zip" "https://go.microsoft.com/fwlink/?LinkID=620882"
unzip "$HOME/Downloads/VSCode.zip"
mv "$HOME/Downloads/Visual\ Studio\ Code.app" "/Applications/"
cp "../../files/vscode/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json"

echo "VSCode Configured"

