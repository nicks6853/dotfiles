# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# You need to download antigen.zsh and put it in the folder below.
source /home/nick/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle aws
antigen bundle virtualenv

# ===================== BEGIN THEME ===================== #
antigen theme romkatv/powerlevel10k

# Highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# ===================== END THEME ===================== #

antigen apply

# Custom bindings
# Bind Alt+Right Arrow to forward-word
bindkey '\e[1;3C' forward-word
# Bind Alt+Left Arrow to backward-word
bindkey '\e[1;3D' backward-word

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
export PATH="${PATH}:/home/${USER}/.platformio/penv/bin"

# RECOMMENDATIONS
# - Install fira code nerd font (not regular fira code)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# If a local zsh config file exists, source it. This can be used for machine-specific configurations.
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
