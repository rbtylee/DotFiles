#
# based on a .bashrc by Graham Poulter, licensed under Creative Commons Attribution 3.0
# http://www.grahampoulter.com/projects-1/linux-rc-files

# Do not glob . or .. when using .*
export GLOBIGNORE='.:..'

## Shell options
shopt -s dirspell     # Correct dir spelling
shopt -s cdspell      # Correct spelling
shopt -s autocd       # autocd
shopt -s checkhash    # Look up commands

shopt -s extglob      # Pattern-matching glob features
shopt -u dotglob      # Do not include .config files in normal glob
shopt -u failglob     # Don't fail on nomatch, just leave the *'s in
shopt -u nullglob     # Don't go to null on nomatch, just leave the *'s in

## History options
shopt -s cmdhist      # Save all lines of multi-line commands in history
shopt -s histappend   # Append to .bash_history on exit
shopt -s histreedit   # Edit failed history subs
# shopt -u histverify # Immediately execute history sub (DISABLED see below)
shopt -s histverify   # Verify history before executing
shopt -s lithist      # save multi-line commands with newlines

# Ignore duplicates and lines starting with space
export HISTCONTROL="ignoreboth"

# Reduce clutter in the history
export HISTIGNORE='&:exit:fc:history:ht:ls:bg:fg:top'

# Timestamp the history entries (important!!)
export HISTTIMEFORMAT="%Y-%m-%d %T "

# Long session history (default is 500)
export HISTSIZE=3000

# Long history file (default is 500)
export HISTFILESIZE=50000

# By default, Bash only records a session to the .bash_history file on
# disk when the session terminates. This means that if you crash or your
# session terminates improperly, you lose the history up to that point.
# You can fix this by recording each line of history as you issue it
# The -a switch writes lines from your current session that aren’t yet in the file.
# The -n switch reads lines from the file that aren’t yet in the session,
# probably for commands issued on another Bash session on the same machine.
PROMPT_COMMAND='history -a; history -n'

## History aliases

# Today's history
function ht { history | grep "$(date +%Y-%m-%d)" $@; }

# Grep history
alias h='history|grep'

# Update history from other shells
# alias hu='history -n'

## Set the title to host:dir, with history appending
# if [[ $TERM == @(rxvt|xterm) ]]; then
#     PROMPT_COMMAND='history -a; echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
# else
#    export PROMPT_COMMAND="history -a;"
# fi

