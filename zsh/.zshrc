# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotshot/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.config/zsh/antigen/share/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle vi-mode
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
# Tell Antigen that you're done.
antigen apply


bindkey jk vi-cmd-mode
