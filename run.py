#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import


import os
import sys
import time
import subprocess


def run_cmd(cmd):
    i = 0
    proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    print("Running {}".format(cmd))
    os.system('setterm -cursor off')
    while proc.poll() is None:
        sys.stdout.write('\r')
        if i  == 0:
            sys.stdout.write('[/]')
            i = 1
        elif i == 1:
            sys.stdout.write('[-]')
            i = 2
        elif i == 2:
            sys.stdout.write('[\\]')
            i = 3
        else:
            sys.stdout.write('[|]')
            i = 0
        time.sleep(0.5)
        sys.stdout.flush()
    sys.stdout.write('\r')
    print("Done...")
    print(os.linesep)
    os.system('setterm -cursor on')

def main():
    print("Preparing system.....")
    run_cmd('apt-get update')
    run_cmd('apt-get upgrade -y')

if __name__ == '__main__':
    if os.getuid() != 0:
        print("***Sudo Privileges required!***")
        os.execvp("sudo", ["sudo"] + sys.argv)
    else:
        main()

