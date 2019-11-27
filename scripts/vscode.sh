#!/bin/bash

set -e

sudo snap install --classic code
cp "../../files/vscode/settings.json" "$HOME/.config/Code/User/settings.json"

echo "VSCode Configured"

