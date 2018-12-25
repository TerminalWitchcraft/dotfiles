import json
import sys
import os

account = sys.argv[1]

mailboxes = []

# with open("~/.offlineimap/mbnames/{}.json".format(account), 'r') as f:
with open(os.path.join(os.path.expanduser("~"), ".offlineimap/mbnames/{}.json".format(account)), 'r') as f:
    data = json.load(f)
    for item in data:
        mailboxes.append("+" + item["foldername"].replace(" ", "\ "))

print("mailboxes {}".format(" ".join(mailboxes)))
# print(" ".join(mailboxes))
