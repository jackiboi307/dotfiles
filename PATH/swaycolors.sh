#!/bin/bash

source ~/PATH/colorconfig.env

#       class                   border    backgr.   text      indica.   child_border
swaymsg client.focused          $focbo    $focbg    $focfg    $foci     $focbo
swaymsg client.focused_inactive $unfbo    $unfbg    $unffg    $unfbo    $unfbo
swaymsg client.unfocused        $unfbo    $unfbg    $unffg    $unfbo    $unfbo
swaymsg client.urgent           $urgent   $focbg    $urgent   $urgent   $urgent

swaymsg client.placeholder      '#000000' '#f00000' '#ffffff' '#000000' '#000000'
swaymsg client.background       '#FF0000'
