#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[94m\]\w \[\e[93m\]>\[\e[0m\] '

# [[ $- == *i* ]] && source ~/ble.sh/out/ble.sh --noattach && clear
