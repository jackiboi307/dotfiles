#!/usr/bin/bash

# must partially correspond with the command in the bottom
pkill -f "python ~/Lemonbar/main.py"
pkill -f "lemonbar -p"

eval python ~/Lemonbar/main.py | lemonbar -pb -f "source code pro"-9 -g x18+0 -B $1 -F $2 -o 0
