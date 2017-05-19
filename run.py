#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import


import os
import sys
from configure import Configure


def main():
    executor = Configure()
    executor()


if __name__ == '__main__':
    if os.getuid() != 0:
        print("***Sudo Privileges required!***")
        os.execvp("sudo", ["sudo"] + sys.argv)
    else:
        main()
