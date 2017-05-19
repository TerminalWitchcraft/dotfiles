#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from six.moves import input
from six import iteritems, iterkeys


def validate_choice(mappings, multiple=False, skippable=False, msg=None):
    """
    Function to validate choices
    """
    user_choice = None
    try:
        for key, value in iteritems(mappings):
            print("{}:\t{}".format(key, value))
        print("A:\tAbort")
        temp_dict = {key.lower(): key for key in iterkeys(mappings)}
        valid_choices = [item.lower() for item in iterkeys(temp_dict)]
        valid_choices.append('a')
        if skippable:
            print("S:\tSkip")
            valid_choices.append('s')
        if msg:print(msg)
        if multiple:print("Multiple choices can be seperated by comma")
        choice_string = "/".join(iterkeys(mappings)) + "/A"
        if skippable:choice_string += "/S"
        choice = input("Enter your choice[{}]: ".format(choice_string))
        choice = choice.lower()
        while True:
            if multiple:
                ans = choice.split(",")
                if not set(ans).issubset(set(valid_choices)):
                    print("Invalid option(s)")
                    choice = input("Enter your choice[{}]:".format(choice_string))
                    choice = choice.lower()
                elif 'a' in ans:sys.exit(1)
                elif 's' in ans:return None
                else:
                    user_choice = [temp_dict[val] for val in ans]
                    break
            else:
                if not choice in valid_choices:
                    print("Invalid choice")
                    choice = input("Enter your choice[{}]:".format(choice_string))
                    choice = choice.lower()
                elif choice == 'a':sys.exit(1)
                elif choice == 's':return None
                else:
                    user_choice = temp_dict[choice]
                    break
    except KeyboardInterrupt:
        sys.exit(1)
    return user_choice
