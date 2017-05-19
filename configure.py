#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import
from __future__ import unicode_literals


import os
import sys
import editors
import shell
from utils.run import run_cmd
from utils.validate import validate_choice


class Configure(object):
    """
    Class to handle execution of setup
    """
    def __init__(self, defaults=False, minimal=True):
        """
        # TODO
        """
        self._shell = 'bash'
        self._defaults = defaults
        self._minimal = minimal
        self._platform = 'unknown'
        self._execution_list = []
        if sys.platform.startswith('linux'):
            self._platform = 'linux'
        else:
            self._platform = 'unknown'

    def __call__(self):
        os.system('clear')
        print("Enter your choice for shell")
        choice = validate_choice(shell.CHOICES,
                                 multiple=False,
                                 skippable=True)
        instance = shell.SHELLS.get(choice, None)
        self._execution_list.append(instance)

        # Start with editors
        os.system('clear')
        print("Enter choice for editors")
        choices = validate_choice(editors.EDITORS,
                                  multiple=True,
                                  skippable=True)
        for choice in choices:
            instance = editors.EDITORS.get(choice, None)
            self._execution_list.append(instance)
        # programming languages

        self.start()

    def get_ready(self):
        """
        Function to get the system ready
        """
        run_cmd(self._platform, 'apt-get update')
        run_cmd(self._platform, 'apt-get upgrade -y')

    def start(self):
        # Prepare system
        self.get_ready()
        for instance in self._execution_list:
            instance(self._platform)()
        print("Done!")
