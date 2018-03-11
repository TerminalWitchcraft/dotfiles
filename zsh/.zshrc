# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch notify
bindkey -v
fpath+=~/.config/zsh/.zfunc
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hotshot/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle vi-mode
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
# Load the theme.
# antigen theme theunraveler
# Tell Antigen that you're done.
antigen apply


bindkey jk vi-cmd-mode
bindkey '^[[Z' reverse-menu-complete
source /usr/bin/virtualenvwrapper.sh
alias ll="exa -lh"
alias vim="nvim"
alias ls=exa
alias lh="exa -ah"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
