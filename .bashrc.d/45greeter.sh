# Log in greeting

# Define some colors first:
blue="$(tput bold;tput setaf 4)"
white="$(tput bold;tput setaf 7)"
gray="$(tput setaf 7)"
#     Text styles
normal="$(tput sgr0)"
#  256 colors
blue_256="$(tput setaf 33)"
gray_256="$(tput setaf 246)" 
# Looks best on a black background.....

if [ "$TERM" = "linux" ]; then
    echo -en "${blue}Bodhi ${normal}${gray}2.1  ${blue}BASH ${normal}${gray}${BASH_VERSION%.*}${blue} - DISPLAY on ${normal}${gray}$DISPLAY ${blue} Linux Kernel ${normal}${gray}`uname -r`${normal}\n\n"
else
    echo -en "${blue_256}Bodhi ${gray_256}2.1  ${blue_256}BASH ${gray_256}${BASH_VERSION%.*}${blue_256} - DISPLAY on ${gray_256}$DISPLAY ${blue_256} Linux Kernel ${gray_256}`uname -r`${normal}\n\n"
fi

date +"%A %m/%d/%y %r"
# weather -c Bluefield  -s WV -i KBLF -q # too slow

echo
if [ -x /usr/games/fortune ]; then 
    /usr/games/fortune -s     # makes our day a bit more fun.... :-)
fi
echo

unset blue white gray normal blue_256 gray_256 
