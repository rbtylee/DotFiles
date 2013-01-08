# Bodhi bod specific stuff defined in 05bodhi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Enable autojump
#  https://github.com/joelthelion/autojump/wiki
if [ -f /usr/share/autojump/autojump.bash ]; then
    . /usr/share/autojump/autojump.bash
else
    echo "Autojump not installed!!"
fi

# Something silly :)
alias ff='wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\>\<i\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"'

# And even sillier ...
#   The Emotiprompt(TM) ~
#       no longer used see 25prompt.sh
#       see http://linuxgazette.net/122/lg_tips.html#tips.1
function smiley() {
    err=$?
    if [ $err == 0 ]; then
        echo ':)'
    else echo ":("
    fi
}

# Need to test this
function grab() {
    sudo chown -R ${USER} ${1:-.}
}

# cause I miss it
#   #todo add optional msg argument 
#    and use "press any key ..." when msg doesn't exist
function pause() {
  local dummy
  read -s -r -p "Press any key to continue..." -n 1 dummy
}

# Super simple calculator
#   if you need anything more advanced use bc, dc or python/perl/...
#   Note: qalculate and Extcalc and prob more have a cli interface also
#         see also gp command in pari-gp package
function ? { awk "BEGIN{ print $* }" ;}

# Opens python command prompt with settings that make it useful 
#     for quick calculations
alias pc='python -ic "from __future__ import division; from math import *"'

# does 't work right
#    #todo
function be_sloc {
    cat "$@" | awk 'BEGIN { count = 0; space = 0; } { \
        if(match("$0","[0-9a-zA-z]+")) { count++; } else { space++; } }
        END { printf("LOC: %d\nSPACE: %d\n",count,space); }'
}

# Removed tilde-files found under $1
function rmtilde() {
    [[ "$1" == "-h" ]] || [[ -z "$1" ]] && { echo "Usage: rmtilde <top-directory>"; return; }
    echo "Removing tilde-backup files under $1"
    find "$1" -name '*~' -print -delete
}

# Display image resolution
function resolution() {
    identify "$1" |grep -o "[[:digit:]]*x[[:digit:]]*" |head -1
}

# Opens a file with xdg-open
function xopen(){
    if [[ $1 ]]; then
        local T=`xdg-mime query filetype $1`
        local mime=(${T//;/ })
        echo "opening file $1  of type $T with  $(xdg-mime query default $mime)"
        xdg-open "$1"
    fi;
}

# Google arguments
#     Opens web browser determined by xdg-open
function google() {
    local search=""
    for term in $*; do
        search="$search%20$term"
    done
    xdg-open "https://www.google.com/search?q=$search"
}

# This functions adds any new gtk-bookmarks to current session
#
function update-gtk-bk(){
  if [ -f ~/bin/.gtk-bookmarks.py ]; then
    ~/bin/.gtk-bookmarks.py
  else
    echo "Error:.gtk-bookmarks.py does not exist"
  fi
  if [ -f ~/.bashrc.d/35gtkBookmarks.sh ]; then
    . ~/.bashrc.d/35gtkBookmarks.sh
  else
    echo "Error:.35gtkBookmarks.sh does not exist"
  fi
}

# This functions removes all gtk-bookmarks aliases
#
function rm-gtk-bk(){
    f="/tmp/bashrc.$RANDOM.html"
    if [ -f ~/bin/.gtk-remove-bk.py ]; then
        .gtk-remove-bk.py > $f
        . $f
     else
         print ".gtk-remove-bk.py not found!!"
     fi
}

# Checks whether a website is down for you, or everybody
# https://github.com/eien/bash-it/blob/master/plugins/available/base.plugin.bash
function down4me(){
  curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'
}

# Pipe html to x-www-browser
#
function browser() {
    f="/tmp/browser.$RANDOM.html"
    cat /dev/stdin > $f
    x-www-browser $f
}

# Preview markdown in web browser
#
function preview-md(){
    if command -v markdown &>/dev/null; then
      markdown $1 | browser
    else
      echo "You don't have a markdown command installed!"
    fi
}

# See what services are running here
function whatsopen {
    sudo nmap -sS -O 127.0.0.1
}
