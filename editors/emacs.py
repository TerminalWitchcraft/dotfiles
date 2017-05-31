#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import

from utils.run import run_cmd
from utils.validate import validate_choice


class Emacs(object):
    """
    Class which sets up emacs configuration
    """
    name = 'emacs'
    def __init__(self, platform):
        self._path = ''
        self._platform = platform

    def __call__(self, *args, **kwargs):
        print("I am from call")
        self.setup()

    def setup(self, default_config=True):
        run_cmd(self._platform, "{} {} {}".format(self._path,
                                                  self._platform))
