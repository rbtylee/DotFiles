export DEBEMAIL="ylee@bodhilinux.com"
export DEBFULLNAME="Rbt Y-Lee"

#   ##todo Use tput for color codes
case "$TERM" in
    xterm*) export TERM=screen-256color    # for a tmux -2 session (also for screen) 
            export GREP_COLOR='38;05;33'
            ;;
    linux)  export GREP_COLOR='0;36'
            ;;
esac 

export GREP_OPTIONS="--exclude-dir=\.svn --exclude-dir=log --exclude-dir=\.git --color=auto"

# Ctrl+D must be pressed twice
export IGNOREEOF=1

# Beeping is annoying
set nobeep
# check the window size after each command and, if necessary,
#   update the values of LINES and COLUMNS.
shopt -s checkwinsize
# don't try to complete empty cmds
shopt -s no_empty_cmd_completion 

# Turn Flow Control Off
stty -ixon

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# import pythonrc here
export PYTHONSTARTUP=~/.pythonrc
