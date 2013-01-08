#!/usr/bin/env python
# add-gtk-bk  version 0.1
#      10.17.2012
#
#
#  (c) Rbt Y-lee <ylee@bodhilinux.com> 2012
#      Do What The Fuck You Want To Public License, v2

import os
import sys
file_name = os.path.expanduser('~/.bashrc.d/35gtkBookmarks.sh')
try:
    with open(file_name) as f:
        content = f.readlines()
except IOError:
    print "IOError: .gtk-bookmarks does not exist"
    sys.exit(1)

for a in content:
    if a[0] != '#':
        print a.rstrip().replace('alias', 'unalias').split('=')[0]
