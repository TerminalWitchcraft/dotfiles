HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
autoload -U promptinit; promptinit
prompt pure
autoload -U compinit && compinit
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' menu select

ZSH_AUTOSUGGEST_USE_ASYNC=1
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "${terminfo[kcbt]}" reverse-menu-complete

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


## pyenv configs
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi


export GPG_TTY=$(tty)
gpg-connect-agent /bye
gpg-connect-agent updatestartuptty /bye >/dev/null

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

