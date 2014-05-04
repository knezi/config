#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
PATH=$PATH:/home/banan/.localbin/
PATH=$PATH:/home/banan/.serverbin/
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
