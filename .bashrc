#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[94m\]\w \[\e[93m\]>\[\e[0m\] '

alias catsay='python ~/Programmering/catsay/main.py'

# command configurations:

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# shortcuts:

alias cls='clear'
alias res='reset'
alias b='cd ..'

# "custom" commands:

alias duck='lynx https://lite.duckduckgo.com/lite'
alias tree='exa -Ta'

# alias shotgun='shotgun ~/Screenshot.png'
# alias shotgun2='sleep 2 && shotgun'
# alias shotwin='shotgun -i `xdotool getwindowfocus`'
# alias shotwin2='sleep 2 && shotwin'

# alias grim='grim ~/Screenshot.png'

alias l='sudo light -S'
alias l+='sudo light -A'
alias l++='sudo light -A 1'
alias l-='sudo light -U'
alias l--='sudo light -U 1'

# programs

alias msnake='~/Appar/msnake/build/msnake'
alias st='~/Appar/St/st'

# cargo

alias cargo_format='python ~/Programmering/CargoShort/short.py'
alias cargo_short='cargo check --message-format json | cargo_format'

# git aliases

alias gitdiff='git diff --cached --name-only'

# alias colorpicker='go run ~/Programmering/Color/colorpicker.go ~/Programmering/Color/colors.go ~/Themes/colors.json'

alias packages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'

function binview {
    xxd -a $1 | less -N -# 1
}

alias keepawake='systemd-inhibit --what=handle-lid-switch' # disables sleep on lid close for as long as given command is running

export PYTHONPATH=/home/jack/Programmering/PATH

# go env -w GOPATH=/home/jack/go
# export GOPATH=/home/jack/go

# [[ $- == *i* ]] && source ~/ble.sh/out/ble.sh --noattach && clear
