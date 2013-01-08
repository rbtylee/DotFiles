# Most of my Alias definitions.
#     more in the 15funcs.sh and 10history.sh files
#
# NOTE: Shell functions are faster.
#       Aliases are looked up after functions and thus resolving is
#       slower. While aliases are easier to understand, shell functions
#       are preferred over aliases for almost every purpose.
#       You should be very careful replacing a standard command with an
#       alias or a function.

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## My aliases
alias cls='clear'     # clears screen ... CPM/MSDOS heritage :)
# caps key 
alias caps-off='xmodmap -e "keycode  66 = Shift_L NoSymbol Shift_L"'
alias caps-on='xmodmap -e "keycode  66 = Caps_Lock NoSymbol Caps_Lock"'
# "-p" lets you create a path structure with one command,
#      ex. mkdir -p /a/b/c
alias md='mkdir -v -p'
alias rd='rmdir -v'
# Back Up a file. Usage "bu filename.txt"
function bu () { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }
alias perm='stat --printf "%a %n \n "'
# resume wget by default
alias wget='wget -c'
alias hist='history'
# ack-grep needs to be installed
command -v colordiff >/dev/null 2>&1 && alias ack='ack-grep' 
# use colordiff instead of diff if available
command -v colordiff >/dev/null 2>&1 && alias diff="colordiff -u"
# use htop instead of top if installed
command -v htop >/dev/null 2>&1 && alias top=htop

grepr ()
{
    grep -r $* --color=always . | less -R
}
grepri ()
{
    grep -ri $* --color=always . | less -R
}

# displays current PATH 1 line per dir
alias path="echo $PATH | tr ':' '\n'"
# Ping google to see if net is up
alias pg='ping www.google.com'

function local-ip(){
  ifconfig | grep "inet\b" | grep -v 127 | awk '{ print $2 }'
}

alias now='date +"%nThe time is %r    %A %m/%d/%y%n"'
# weather needs to be installed to use
command -v weather >/dev/null 2>&1 &&  alias forecast='echo;weather -c Bluefield  -s WV -i KBLF -q;echo;'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
## mispellings
alias maek='make'
alias alais='alias'
alias csl='clear'

## chown
for mod in x w r; do
  alias -- "+$mod"="chmod +$mod"
  alias -- "-$mod"="chmod -- -$mod"
done

## Directory navigation
#      see also autojump script which is sourced
#
# Shows current directory
alias .='pwd'
# Go to home
alias ~='cd ~'
# Goes to the root directory
function /() { cd /; }
# Go up some
alias ..='cd ..'
alias ...='cd ../..'
# Goes to previous directory
alias -- -='cd -'
# change to the real directory if in a linked directory
alias rd='cd `pwd -P`'
# Get full/absolute path to $1
alias abspath='readlink -f'
# Clone this location
alias pc="pushd \`pwd\`"
# Push new location
alias pu="pushd"
# Pop current location
alias po="popd"
# Easy way to scroll up und down to change to one of n last visited directories.
#    This alias is meant to append n (here is n=10) most recently used
#    cd commands to the bottom of history file. This way you can easily
#    change to one of previous visited directories simply by hitting
#    1-10 times the arrow up key.
alias cdd="history -a && grep '^ *[0-9]* *cd ' ~/.bash_history| tail -10 >>~/.bash_history && history -r ~/.bash_history"
#     Note: The same 'trick could be used with other commands

alias myls='ls --group-directories-first'
alias mylsa='ls -a  --group-directories-first'

alias lsdir='ls -d */'
alias lsdirf='ls -dahl */'

alias lsdira='ls -d .*"/"'
alias lsdirfa='ls -dahl .*/'

alias lsfile='ls -F | grep -v /'
alias lsfilef='ls -l | egrep -v '^d''

alias lsfilea='ls -a | grep -v /'
# ????
alias lsfilefa='ls -F | grep -v /'

## apt and dpkg
alias apt-i='sudo apt-get -y --no-install-recommends install'
alias apt-u='sudo apt-get update'
alias apt-s='apt-cache search'
# Search for dev files
apt-sd() { apt-cache search $1 | grep "lib.*dev "; } # Search for dev files
alias apt-r='sudo apt-get remove'
alias apt-p='sudo apt-get purge'
alias apt-a='sudo apt-get autoremove'
alias upgrade='sudo apt-get update; sudo apt-get dist-upgrade'
#  ##todo add tab completion support for dpkg-version
function dpkg-version(){
  dpkg-query --status $1 | grep Version
}

## Memory utilities
alias memfree='cat /proc/meminfo | grep MemFree | cut -d: -f2 | cut -dk -f1'
alias memtotal='cat /proc/meminfo | grep MemTotal | cut -d: -f2 | cut -dk -f1'
function memfreepcnt {
  memf=`memfree`
  memt=`memtotal`
  echo "scale=5; $memf/$memt*100" | bc -l
}

## Process utility
alias psx="ps -auxw ¦ grep $1"

## Shutdown, ...
# 
#   #todo   should use dbus or something so don't need sudo 
alias bye='sudo shutdown -h now'
alias byebye='sudo reboot'

## Confirm for cp/mv/rm/crontab
#  https://github.com/gpoulter/shellfiles/blob/master/bash/functions
function becareful(){
  if [[ "$1" == "off" ]]; then
      unalias rm cp mv crontab
      echo "rm, cp and mv are now non-interactive."
  else
      alias rm="rm -i"
      alias cp="cp -i"
      alias mv="mv -i"
      alias crontab="crontab -i"
      echo "rm, cp, mv, crontab are now interactive."
  fi
}

## Confirm for cp/mv/crontab
#  replace rm with trash command
#  reguires trash-cli installed
#
#   #todo add test for trash-cli
function beverycareful(){
  if [[ "$1" == "off" ]]; then
      unalias rm cp mv crontab
      echo "rm, cp and mv are now non-interactive."
  else
      alias rm="trash" 
      alias cp="cp -i"
      alias mv="mv -i"
      alias crontab="crontab -i"
      echo "rm, cp, mv, crontab are now interactive."
  fi
}
