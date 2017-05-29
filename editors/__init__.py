from .vim import Vim

CHOICES = {
    'V': 'Vim',
    'E': 'Emacs',
    'S': 'Sublime Text'
}

EDITORS = {
    'V': Vim,
    'E': Vim,
    'S': Vim
}


__all__ = ['CHOICES', 'EDITORS']
