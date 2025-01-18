#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=0xff0E1013
else
  sketchybar --set $NAME background.color=0x00000000
fi