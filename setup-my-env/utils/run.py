#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import unicode_literals

import os
import sys
import time
import subprocess


def run_cmd(platform, cmd):
    i = 0
    proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE,
                            stdin=subprocess.PIPE)
    print("Running {}".format(cmd))
    os.system('setterm -cursor off')
    while proc.poll() is None:
        out_string = proc.stdout.readline().decode()
        if 'password' in out_string:pass
        else:
            sys.stdout.write('\r')
            if i == 0:
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
