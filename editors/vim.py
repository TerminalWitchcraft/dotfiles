#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import


from utils.run import run_cmd
from utils.validate import validate_choice


class Vim(object):
    """Class which sets up vim configuration"""
    name = 'vim'

    def __init__(self, platform, plugin_manager='Plug'):
        self._path = '../scripts/vim.sh'
        self._platform = platform
        self._plugin_manager = plugin_manager
        self.get_plugin_manager()

    def get_plugin_manager(self):
        """
        Function to get plugin_manager from user
        """
        options = {
            "Pl": "Vim-Plug",
            "Pa": "Panthogen",
            "V": "Vundle"
        }
        choice = validate_choice(options, multiple=False,
                                 skippable=True,
                                 msg="Vim-Plug will be used if skipped")
        if choice == "V":
            self._plugin_manager = "Vundle"
        elif choice == 'Pa':
            self._plugin_manager = "Panthogen"
        elif choice is None:
            self._plugin_manager = "Plug"
        else:
            self._plugin_manager = "Plug"

    @property
    def plugin_manager(self):
        return self._plugin_manager

    @plugin_manager.setter
    def plugin_manager(self, x):
        self._plugin_manager = x
        print("setter", self._plugin_manager)

    @plugin_manager.getter
    def plugin_manager(self):
        print("getter ", self._plugin_manager)
        return self._plugin_manager

    def __call__(self, *args, **kwargs):
        print(args)
        print(kwargs)
        print("I am from call")

    def setup(self, default_config=True):
        if default_config:
            run_cmd(self._platform, "{} {}".format(self._path,
                                                   self._plugin_manager))
        else:
            pass
