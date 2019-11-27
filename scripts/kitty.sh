#!/bin/bash

set -e

mkdir -p $HOME/.config/kitty
cp ../files/kitty/*.conf $HOME/.config/kitty

echo "Kitty Configured"

