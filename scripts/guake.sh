#!/bin/bash

set -e

if command -v guake-toggle >/dev/null 2>&1; then
    echo "Guake is already installed!"
else
    sudo apt-get install --yes guake
fi

