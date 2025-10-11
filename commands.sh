# shopt -s expand_aliases

source ~/priv_commands.sh

# Command defaults

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias du='du -h'
alias lynx='lynx --display_charset=utf-8'
alias exa='exa --group-directories-first'

# Shortcuts

alias cls='clear'
alias res='reset'
alias b='cd ..'

alias bt='bluetuith'

# "Custom" commands

alias duck='lynx https://lite.duckduckgo.com/lite'
# alias packages='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)'
alias largestpackages="LC_ALL=C.UTF-8 pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | LC_ALL=C.UTF-8 sort -h"
alias keepawake='systemd-inhibit --what=handle-lid-switch' # disables sleep on lid close for as long as given command is running
alias new='alacritty --working-directory="`pwd`" & disown'
alias reloadprofile='source ~/.profile; source ~/.bashrc'
alias activate='source .venv/bin/activate' # python venv
# alias scp='rsync -av -e ssh' # fake scp

EXCLUDED='.git|__pycache__'
alias tree="exa -Ta -I '$EXCLUDED'"

# git

alias gitdiff='git diff --cached --name-only'
alias gitlocalignore='git config core.excludesfile'
alias gitsubinit='git submodule update --init --recursive'
alias gitsubupdate='git submodule update --recursive --remote'

# Functions

function sizes {
    # sizes [directory]
    du --max-depth 1 $1 | sort -hr
}

function largestfiles {
    # largest [directory] [threshold]
    du -t ${2:-1G} $1 | sort -hr
}

function lndir {
    rm -rf $2
    cp -rl $1 $2
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

# Arduino

alias arduino='arduino-cli'
alias acompile="arduino-cli compile -b arduino:avr:uno"
alias aupload="arduino-cli upload -p /dev/ttyACM3 -b arduino:avr:uno"
alias amonitor="arduino-cli monitor -p /dev/ttyACM3; echo"

function arun {
    echo Compiling...
    acompile "$@" || return
    echo Uploading...
    aupload "$@" || return
    echo Monitoring...
    amonitor
}

# Programs

alias msnake='~/Appar/msnake/build/msnake'
alias st='~/Appar/St/st'
alias catsay='python ~/Programmering/catsay/catsay.py'

# alias cargo_format='python ~/Programmering/CargoShort/short.py'
# alias cargo_short='cargo check --message-format json | cargo_format'
alias cargo_short='cargo check --message-format json | python ~/Programmering/CargoShort/short.py'
