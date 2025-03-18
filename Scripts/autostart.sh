#!/bin/bash

source /home/jack/commands.sh

# Discord bot
cd /home/jack/Programmering/Discord/truppbot
BOT_CMD='python truppbot.py'
pkill -f "$BOT_CMD"
keepawake $BOT_CMD >> log 2>&1 & disown
cd

# Hemsida
cd /home/jack/Programmering/Kattmys
# Borde göra 'pkill ...', 'keepawake' och '& disown' på egen hand
start
cd
