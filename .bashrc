#
# ~/.bashrc
#

# if not running interactively, don't do anything
# [[ $- != *i* ]] && return

PS1_NORMAL='\[\e[94m\]\w \[\e[93m\]>\[\e[0m\] '
PS1_LARGE='\[\e[94m\]\w\n\[\e[93m\]>\[\e[0m\] '
PS1=$PS1_NORMAL

source ~/commands.sh

# [[ $- == *i* ]] && source ~/ble.sh/out/ble.sh --noattach && clear
