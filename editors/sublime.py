#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
from __future__ import unicode_literals
from __future__ import absolute_import

from utils.run import run_cmd
from utils.validate import validate_choice


class Sublime(object):
    """
    Class which sets up sublime configuration
    """
    name = 'sublime'
    def __init__(self, platform):
        self._path = ''
        self._platform = platform
        self._ppa = 'ppa:webupd8team/sublime-text-3'
        self._plugin_cmd = "import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)"

    def __call__(self, *args, **kwargs):
        print("I am from call")

    def setup(self, default_config=True):
        run_cmd(self._platform, "sudo add-apt-repository {}".format(self._ppa))
        run_cmd(self._platform, "sudo apt-get update")
        run_cmd(self._platform, "sudo apt-get install sublime-text-installer")
        run_cmd(self._platform,
                "subl --command \"{}\" --command \"exit\"")
