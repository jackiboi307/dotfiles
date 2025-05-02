#!/bin/bash

# Skript som gör så pekplattan inte stängs av när man skriver,
# vilket gör det omöjligt att spela spel

xinput set-prop 10 "libinput Disable While Typing Enabled" 0

# Om ovan inte funkar, byt ut 10 mot rätt kod:
# xinput list

