# ~/.bashrc
#
#  (c) rbt ylee <ylee@bodhilinux.com> 2012 
#  Do What The Fuck You Want To Public License, v2

## If not running interactively, don't do anything
[ -z "$PS1" ] && return

## Enable programmable tab completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## Enable user defined tab completions
#    should I test to see if it exists?
for script in ~/.bash_completion.d/*; do
  . "$script"
done

## Enable user defined modular definitions
#   First add gtk-bookmarks aliases
if [ ! -f ~/.gtk-bookmarks ]; then
    touch ~/.gtk-bookmarks
fi
if [ -f ~/bin/.gtk-bookmarks.py ]; then
  ~/bin/.gtk-bookmarks.py
else
  echo "Error:.gtk-bookmarks.py does not exist"
fi

#   Then add .bashrc.d scripts
#   Should I test to see if it exists?
for script in ~/.bashrc.d/*; do
  . "$script"
done

## Source system local bashrc stuff
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Load Solarize theme for dir colors
#   see http://ethanschoonover.com/solarized
#       https://github.com/seebi/dircolors-solarized
#
#  #todo test to see if dircolors16/256 exists
#  as well as if [ -x /usr/bin/dircolors ]; then
if [ "$TERM" != "linux" ]; then
    eval `dircolors ~/.dircolors256`
else
    eval `dircolors ~/.dircolors16`
fi

## Other relevant files
#     ~/.Xmodmap (Keyboard mappings) is loaded by lightdm at login
#         for lxdm need to do something else to load it
#     .inputrc read by readline whenever bash starts
#         controls bash editing
