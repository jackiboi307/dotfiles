#!/bin/bash

# Discord bot
cd /home/jack/Programmering/Discord/truppbot
BOT_CMD='python main.py'
pkill -f "$BOT_CMD"
systemd-inhibit --what=handle-lid-switch $BOT_CMD >> log 2>&1 & disown
cd

# Hemsida
cd /home/jack/Programmering/Kattmys
# Borde göra 'pkill ...' och '& disown' på egen hand
start
cd
