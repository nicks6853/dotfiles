#!/bin/bash

set -e

cat ../files/bash/.bashrc >> $HOME/.bashrc

: $HOME/.profile
cp ../files/bash/.profile $HOME/.profile
