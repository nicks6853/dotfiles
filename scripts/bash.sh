#!/bin/bash

set -e

sudo apt-get install -y feh

cat ../files/bash/.bashrc >> $HOME/.bashrc

: $HOME/.profile
cp ../files/bash/.profile $HOME/.profile

echo "Bash Prompt Configured"

