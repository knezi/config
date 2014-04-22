#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
PATH=$PATH:/home/knezi/.localbin/
PATH=$PATH:/home/knezi/.serverbin/
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
