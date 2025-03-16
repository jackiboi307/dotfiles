#!/bin/bash

# Automatically start Discord bot
BOT_DIR='/home/jack/Programmering/Discord/truppbot'
BOT_CMD=$BOT_DIR/main.py
BOT_LOG=$BOT_DIR/log
pkill -f $BOT_CMD
systemd-inhibit --what=handle-lid-switch python $BOT_CMD >> $BOT_LOG 2>&1 & disown
