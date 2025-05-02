#!/bin/bash

# WARNING! don't use script when editing file in an editor

eval $(xdotool getmouselocation --shell)

X0=$X
Y0=$Y

on_int() {
    eval $(xdotool getmouselocation --shell)

    W=$(($X-$X0))
    H=$(($Y-$Y0))

    # geom=""
    # geom+="$W"
    # geom+="x"
    # geom+="$H"
    # geom+="+"
    # geom+="$X0"
    # geom+="+"
    # geom+="$Y0"

    # shotgun -g $geom ~/Screenshot.png
    
    geom=""
    geom+="$X0"
    geom+=","
    geom+="$Y0"
    geom+=" "
    geom+="$W"
    geom+="x"
    geom+="$H"

    grim -g "$geom" ~/Screenshot.png

    # remove timeout
    pkill --signal INT -f shotgunarea.sh

    exit
}

# wait until SIGINT
trap 'on_int' SIGINT
read
