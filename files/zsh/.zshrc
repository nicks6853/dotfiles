# You need to download antigen.zsh and put it in the folder below.
source /home/nick/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle aws

# ===================== BEGIN THEME ===================== #
source /home/nick/.z-monokai

# Highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# ===================== END THEME ===================== #

antigen apply

# Define aliases
alias vim="nvim"
alias activate="source .venv/bin/activate"
alias gl="git log --all --oneline --graph --decorate"

# Set NVM configurations
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Set env variables
export PATH=$PATH:/home/nick/.local/bin
export PATH="${PATH}:${HOME}/custom_scripts"

