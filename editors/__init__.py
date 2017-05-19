from .vim import Vim

CHOICES = {
    'V': 'Vim',
    'E': 'Emacs',
    'S': 'Sublime Text'
}

EDITORS = {
    'V': Vim,
    'E': None,
    'S': None
}


__all__ = ['CHOICES', 'EDITORS']
