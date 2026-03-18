#!/bin/bash

set -e

# Ensure .antigen directory exists
[[ ! -d "${HOME}/.antigen" ]] && mkdir -p "${HOME}/.antigen"

curl -L git.io/antigen > "${HOME}/.antigen/antigen.zsh"

