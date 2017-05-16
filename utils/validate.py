#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
from six.moves import input
from six import iteritems, iterkeys


def validate_choice(mappings, multiple=False):
    """
    Function to validate choices
    """
    user_choice = None
    try:
        for key, value in iteritems(mappings):
            print("{}: {}".format(key, value))
        print("A: Abort")
        print("S: Skip")
        temp_dict = {key.lower(): key for key in iterkeys(mappings)}
        valid_choices = [item.lower() for item in iterkeys(temp_dict)]
        valid_choices += ['a', 'c']
        if multiple:
            print("Multiple choices can be seperated by comma")
        else:
            pass
        choice = input("Enter your choice[{}]: ".format("/".join(iterkeys(mappings)) + "/A/C"))
        choice = choice.lower()
        while True:
            if multiple:
                ans = choice.split(",")
                if not set(ans).issubset(set(valid_choices)):
                    print("Invalid option(s)")
                    choice = input("Enter your choice[{}]: ".format("/".join(
                        iterkeys(mappings)) + "/A/C"))
                    choice = choice.lower()
                elif 'a' in ans:
                    sys.exit(1)
                elif 'c' in ans:
                    break
                else:
                    user_choice = [temp_dict[val] for val in ans]
                    break

            else:
                if not choice in valid_choices:
                    print("Invalid choice")
                    choice = input("Enter your choice[{}]: ".format("/".join(
                        iterkeys(mappings)) + "/A/C"))
                    choice = choice.lower()
                elif 'a' == choice:
                    sys.exit(1)
                elif 'c' == choice:
                    break
                else:
                    user_choice = temp_dict[choice]
                    break
    except KeyboardInterrupt:
        sys.exit(1)
    return user_choice

