#!/bin/bash

source ~/.profile

# Focused windows
focbo=$FG2
focbg=$BG1
focfg=$FG
foci=$BRIGHT_BLUE

# Unfocused windows
# unfbo='#3c3836'
unfbo=$BG2
unfbg=$BG
unffg=$FG1

# Urgent windows
urgent=$RED
# urgent='#cc241d'

# Sway:

#       class                   border    backgr.   text      indica.   child_border
swaymsg client.focused          $focbo    $focbg    $focfg    $foci     $focbo
swaymsg client.focused_inactive $unfbo    $unfbg    $unffg    $unfbo    $unfbo
swaymsg client.unfocused        $unfbo    $unfbg    $unffg    $unfbo    $unfbo
swaymsg client.urgent           $urgent   $focbg    $urgent   $urgent   $urgent

swaymsg client.placeholder      '#000000' '#f00000' '#ffffff' '#000000' '#000000'
swaymsg client.background       '#FF0000'
