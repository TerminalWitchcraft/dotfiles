#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import unicode_literals
from ..utils.run import run_cmd


class Vim(object):
    """Class which sets up vim configuration"""
    def __init__(self, platform, plugin_manager='Plug'):
        self.platform = platform
        self.plugin_manager = plugin_manager
        self.path = '../scripts/vim.sh'
        if self.plugin_manager == 'Panthogen':
            self.prefix = None
        elif self.plugin_manager == 'Vundle':
            self.prefix = 'Plugin'
        else:
            self.prefix = 'Plug'


    def __call__(self, *args, **kwargs):
        pass

    def setup(self, default_config=True):
        pass
        if default_config:
            run_cmd(self.platform, "{} {}".format(self.path, self.plugin_manager))
        else:
            pass
