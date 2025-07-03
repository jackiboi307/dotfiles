#
# ~/.bashrc
#

# if not running interactively, don't do anything
# [[ $- != *i* ]] && return

source ~/commands.sh

PS1_0='\[\e[94m\]\w \[\e[93m\]>\[\e[0m\] '  # Normal
PS1_1='\[\e[94m\]\w\n\[\e[93m\]>\[\e[0m\] ' # With newline
PS1_2='$ '                                  # Minimal

PS1=$PS1_0

PS1_SELECTION=0

function ps1() {
    # Cycle between PS1's
    
    PS1_SELECTION=$(( (PS1_SELECTION + 1) % 3 ))
    PS1="PS1_${PS1_SELECTION}"
    PS1="${!PS1}"
}
