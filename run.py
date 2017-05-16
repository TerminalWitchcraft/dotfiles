#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import


import os
import sys
from utils.run import run_cmd
from utils.validate import validate_choice


def main():
    print("Preparing system.....")
    if sys.platform.startswith('linux'):
        platform = 'linux'
    else:
        platform = 'unknown'
    # run_cmd(platform, 'apt-get update')
    # run_cmd(platform, 'apt-get upgrade -y')
    print("Enter your choice for editor:")
    editor_choices = {
        'V': 'Vim',
        'E': 'Emacs',
        'SL': 'Sublime Text'
    }
    result = validate_choice(editor_choices, False)
    # TODO

if __name__ == '__main__':
    if os.getuid() != 0:
        print("***Sudo Privileges required!***")
        os.execvp("sudo", ["sudo"] + sys.argv)
    else:
        main()

