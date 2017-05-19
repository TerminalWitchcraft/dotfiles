#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import


import os
import sys
import editors
import shell
from utils.run import run_cmd
from utils.validate import validate_choice


def main():
    print("Preparing system.....")
    if sys.platform.startswith('linux'):
        platform = 'linux'
    else:
        # need to support later for darwin
        platform = 'unknown'
    # run_cmd(platform, 'apt-get update')
    # run_cmd(platform, 'apt-get upgrade -y')


    # first we let the use choose which shell does he/she prefer



    # Secondly we let the user choose the editor(s) he/she prefers
    alist = []
    print("Enter your choice for editor:")
    result = validate_choice(editors.CHOICES, False)
    selection = editors.EDITORS.get(result, None)

    alist.append(selection)
    for item in alist:
        item(platform)(minimal=True)
    # TODO

    # Thirdly we choose the programming languages setup he/she prefer


    # Finally we run the Runner class, which install everything in sequential
    # order

if __name__ == '__main__':
    if os.getuid() != 0:
        print("***Sudo Privileges required!***")
        os.execvp("sudo", ["sudo"] + sys.argv)
    else:
        main()

