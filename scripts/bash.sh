#!/bin/bash

set -e

cat ../files/bash/.bashrc >> $HOME/.bashrc

: ~/.profile
cp ../files/bash/.profile $HOME/.profile
