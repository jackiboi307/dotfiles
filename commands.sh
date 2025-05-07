# shopt -s expand_aliases

# Command defaults

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias browsh="browsh --startup-url lite.duckduckgo.com/lite"
alias du='du -h'

# Shortcuts

alias cls='clear'
alias res='reset'
alias b='cd ..'

alias l='sudo light -S'
alias l+='sudo light -A'
alias l++='sudo light -A 1'
alias l-='sudo light -U'
alias l--='sudo light -U 1'

alias arduino='arduino-cli'
alias bt="bluetuith"

# "Custom" commands

alias duck='lynx https://lite.duckduckgo.com/lite'
alias packages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'
alias keepawake='systemd-inhibit --what=handle-lid-switch' # disables sleep on lid close for as long as given command is running
alias gitdiff='git diff --cached --name-only'
alias new='alacritty --working-directory="`pwd`" & disown'
alias reloadprofile='source ~/.profile; source ~/.bashrc'

EXCLUDED='.git|__pycache__'
alias tree="exa -Ta -I '$EXCLUDED'"

function sizes {
    # sizes [directory]
    du --max-depth 1 $1 | sort -hr
}

function largest {
    # largest [directory] [threshold]
    du -t ${2:-1G} $1 | sort -hr
}

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

# Scripts

alias catsay='python ~/Programmering/catsay/main.py'
alias loop='~/Scripts/loop.sh'

alias cargo_format='python ~/Programmering/CargoShort/short.py'
alias cargo_short='cargo check --message-format json | cargo_format'

# Programs

alias msnake='~/Appar/msnake/build/msnake'
alias st='~/Appar/St/st'
