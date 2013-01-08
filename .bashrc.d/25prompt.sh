# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a color prompt
#     assume it's compliant with Ecma-48 (ISO/IEC-6429) that is
#     we can use ANSI escape sequences
#     http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-048.pdf
case "$TERM" in
    xterm-color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    linux) color_prompt=yes;;
esac

# Define some colors to make it easier
#
#  I used to use 'ANSI escape sequences' but 
#  changed to tput for greater portability.
#
#  Text styles
#       add dim and use as normal below to 'unbold'
normal="$(tput sgr0)"
underline="$(tput smul)"
#  tty colors
#   The default terminfo entry for TERM=linux defines only 8 colors
#   This is what I get in a tty
green="$(tput setaf 2)"
blue="$(tput setaf 6)" # Not blue
gray="$(tput setaf 7)"
c8_s="$(tput bold;tput setaf 7)"
c8_f="$(tput bold;tput setaf 1)"
#   All other cases where color_prompt is set I am assuming 256 colors 
c256_1="$(tput setaf 246)" # '\e[38;05;246m'
c256_2="$(tput setaf 33)"  # '\e[38;05;33m'
c256_3="$(tput setaf 242)" # '\e[38;05;242m'
c256_s="$(tput setaf 250)" # '\e[38;05;250m'
c256_f="$(tput setaf 124)" # '\e[38;05;124m'

# Set Prompt 
#     should make case with 8 color as default
if [ "$color_prompt" = yes ]; then 
    if [ "$TERM" = "linux" ]; then
        # 8 colors
        PS1="\[$green\]\u \[$blue\]\w\n\[$normal\]\[$underline\]\[$gray\]\!\[$normal\]\`if [ \$? = 0 ]; then echo '\[$c8_s\]'; else echo '\[$c8_f\]'; fi\`  \$ \[$normal\]"
    else
        # 256 colors
        PS1="\[$c256_1\]\u \[$normal\]\[$c256_2\]\w\n\[$normal\]\[$c256_3\]\[$underline\]\!\[$normal\]\`if [ \$? = 0 ]; then echo '\[$c256_s\]'; else echo '\[$c256_f\]'; fi\` \$ \[$normal\]"
    fi
else
    PS1='\u \w\n\! $ '
fi

# Clean up namespace
unset green blue gray c8_s c8_f normal underline
unset c256_1 c256_2 c256_3 c256_s c256_f
unset color_prompt
