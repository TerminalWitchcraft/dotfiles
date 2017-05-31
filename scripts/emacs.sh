#!/bin/sh

dir='../config'
default_dir='../defaults'
minimal_dir='../minimal'

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt-get install emacs25
