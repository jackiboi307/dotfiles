# shopt -s expand_aliases

source ~/priv_commands.sh

# Command defaults

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias du='du -h'
alias lynx='lynx --display_charset=utf-8'
# alias browsh="browsh --startup-url lite.duckduckgo.com/lite"

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
alias bt='bluetuith'

# "Custom" commands

alias duck='lynx https://lite.duckduckgo.com/lite'
# alias packages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'
alias largestpackages="LC_ALL=C.UTF-8 pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | LC_ALL=C.UTF-8 sort -h"
alias keepawake='systemd-inhibit --what=handle-lid-switch' # disables sleep on lid close for as long as given command is running
alias gitdiff='git diff --cached --name-only'
alias new='alacritty --working-directory="`pwd`" & disown'
alias reloadprofile='source ~/.profile; source ~/.bashrc'

alias ps1n='PS1=$PS1_NORMAL'
alias ps1l='PS1=$PS1_LARGE'

EXCLUDED='.git|__pycache__'
alias tree="exa -Ta -I '$EXCLUDED'"

function sizes {
    # sizes [directory]
    du --max-depth 1 $1 | sort -hr
}

function largestfiles {
    # largest [directory] [threshold]
    du -t ${2:-1G} $1 | sort -hr
}

function binview {
    xxd -a $1 | less -N -# 1
}

function isrunning {
    pkill --signal 0 -f $1 && echo Running!
}

function flask {
    python -m flask --app $1 run $2 $3 $4 $5
}

# ffmpeg commands

function ff_init {
    # take input and output file arguments
    infile=$1
    outfile=$2
    if [ -z "$outfile" ]; then
        outfile=$infile
    fi
}

# function ff_checkargs {
    # take all 
# }

function ffsetwidth {
    ffinit_ $@
    ffmpeg -i 
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
