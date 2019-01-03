set -U fish_greeting
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
fish_vi_key_bindings
source /usr/share/doc/pkgfile/command-not-found.fish
status --is-interactive; and source (jump shell fish --bind=z | psub)
