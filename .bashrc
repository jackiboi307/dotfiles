#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[94m\]\w \[\e[93m\]>\[\e[0m\] '

# command configurations:

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias browsh="browsh --startup-url lite.duckduckgo.com/lite"

# shortcuts:

alias cls='clear'
alias res='reset'
alias b='cd ..'

alias l='sudo light -S'
alias l+='sudo light -A'
alias l++='sudo light -A 1'
alias l-='sudo light -U'
alias l--='sudo light -U 1'

# "custom" commands:

alias duck='lynx https://lite.duckduckgo.com/lite'
alias tree='exa -Ta'
alias packages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'
alias keepawake='systemd-inhibit --what=handle-lid-switch' # disables sleep on lid close for as long as given command is running

function binview {
    xxd -a $1 | less -N -# 1
}

function isrunning {
    pkill --signal 0 -f $1 && echo Running!
}

# alias shotgun='shotgun ~/Screenshot.png'
# alias shotgun2='sleep 2 && shotgun'
# alias shotwin='shotgun -i `xdotool getwindowfocus`'
# alias shotwin2='sleep 2 && shotwin'

# alias grim='grim ~/Screenshot.png'

# scripts

alias catsay='python ~/Programmering/catsay/main.py'
alias loop='~/Scripts/loop.sh'

# programs

alias msnake='~/Appar/msnake/build/msnake'
alias st='~/Appar/St/st'

# cargo

alias cargo_format='python ~/Programmering/CargoShort/short.py'
alias cargo_short='cargo check --message-format json | cargo_format'

# git aliases

alias gitdiff='git diff --cached --name-only'

# alias colorpicker='go run ~/Programmering/Color/colorpicker.go ~/Programmering/Color/colors.go ~/Themes/colors.json'

# [[ $- == *i* ]] && source ~/ble.sh/out/ble.sh --noattach && clear
