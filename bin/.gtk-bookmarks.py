#!/usr/bin/env python
#  
# .gtk-bookmarks.py  version 0.1
#      10.16.2012 16:58:57
#
#      This program reads the ~/.gtk-bookmarks file
#      and creates bash alias commands out of each bookmark.
#      Writes file: ~/.bashrc.d/35gtkBookmarks.sh'
#      Used by .bashrc
#
#      Note: any bookmark with a space in the name as in 'foo bar'
#            will be aliased as foo_bar
#
#  To Do:
#      No check to see if alias name is in use.
#      Currently assuming all gtk-bookmark lines start with:
#          file://
#      Can it be other values like ftp: or url?
#      If so deal with.
#
#  (c) Rbt Y-lee <ylee@bodhilinux.com> 2012
#      Do What The Fuck You Want To Public License, v2

import os
import sys

GTK=os.path.expanduser("~/.gtk-bookmarks")
file_name = os.path.expanduser('~/.bashrc.d/35gtkBookmarks.sh')
header  = "# 35gtkBookmarks.sh\n#\n#\tMachine generated file\n#\n#\tDO NOT EDIT\n#\n"
header += "#\tTo update this file run the update-gtk command\n"
header += "#\tdefined in the 15funcs.sh file.\n\n"

try:
    with open(GTK) as f:
        content = f.readlines()
except IOError:
    print "IOError: .gtk-bookmarks does not exist"
    sys.exit(1)

try:
    with open(file_name, 'w') as gtk_file:
        gtk_file.write(header)
        for bk in content:
            bk_temp=bk.split()
            bk_dir = bk_temp[0]
            name = bk[len(bk_dir)+1:].rstrip()
            # Have to take into account spaces in either name or bk_dir
            gtk_file.write( "alias %s='cd \"%s\"'\n" %(name.replace(" ", "_"), bk_dir[7:].replace("%20", " ")))
except IOError, msg:
    print "IOError: %s" %msg
    sys.exit(1)

# All Wrongs Reserved.
