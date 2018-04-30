#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

## run feh --bg-scale /home/hotshot/Pictures/background.jpg &
run compton
run dunst
run unclutter -idle 2
run setxkbmap -option caps:swapescape
run redshift
