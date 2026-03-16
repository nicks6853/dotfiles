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

alias vim="nvim"
