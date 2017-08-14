# Exports

export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GIMP2_DIRECTORY="$XDG_CONFIG_HOME"/gimp
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export XCOMPOSEFILE="$XDG_CONFIG_HOME"/X11/xcompose
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass


export PAGER=/bin/vimpager
export EDITOR=vim
export VISUAL=vim
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc


#Alias
alias less=$PAGER
alias zless=$PAGER
alias tmux="tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"
alias lh="ls -ah"

#Others
# install xdg-usr-dirs package
if [ -f ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs ]; then
	. ${XDG_CONFIG_HOME:-~/.config}/user-dirs.dirs
fi
