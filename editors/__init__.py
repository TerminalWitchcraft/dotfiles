from .vim import Vim
from .emacs import Emacs
from .sublime import Sublime

CHOICES = {
    'V': 'Vim',
    'E': 'Emacs',
    'S': 'Sublime Text'
}

EDITORS = {
    'V': Vim,
    'E': Emacs,
    'S': Sublime
}


__all__ = ['CHOICES', 'EDITORS']
