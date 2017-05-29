#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import absolute_import
from __future__ import unicode_literals

from utils.run import run_cmd
from utils.validate import validate_choice


class Zsh(object):
    """
    Class which sets up zsh shell for the current user
    """
    name = 'zsh'

    def __init__(self, platform, framework='omz'):
        """
        platform: linux or darwin
        """
        self._path = '../scripts/install_zsh.sh'
        self._platform = platform
        self._framework = framework
        self.get_framwork()

    def get_framwork(self):
        """
        Function to get framework option from user
        """
        options = {
            'O': "Oh-my-zsh",
            'P': "Prezto",
            'An': "Antigen"
        }
        choice = validate_choice(options, multiple=False,
                                  skippable=True,
                                  msg='Oh-my-zsh will be used if skipped')
        if choice == 'O':
            self._framework = 'omz'
        elif choice == 'P':
            self._framework = 'prezto'
        elif choice is None:
            self._framework = None
        else:
            self._framework = 'antigen'

    @property
    def framework(self):
        return self._framework

    @framework.setter
    def framework(self, x):
        self._framework = x
        print("Setter for framework", self._framework)

    @framework.getter
    def framework(self):
        print("Getter from framework", self._framework)
        return self._framework

    def __call__(self, *args, **kwargs):
        print(args)
        print(kwargs)
        print("I am from call of zsh")

    def setup(self, default_config=True):
        cmd = self._path + self._platform + self._framework
        run_cmd(self._platform, cmd)
