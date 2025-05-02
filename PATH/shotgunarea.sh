#!/bin/bash

# WARNING! don't use script when editing file in an editor

# run shotgunarea1.sh if it isn't running
pkill --signal 0 -f shotgunarea1.sh || (
    (sleep 10 && pkill --signal INT -f shotgunarea1.sh) & # timeout
    (~/Scripts/shotgunarea1.sh && exit)
)

# if it is running, send SIGINT to it
pkill --signal INT -f shotgunarea1.sh
