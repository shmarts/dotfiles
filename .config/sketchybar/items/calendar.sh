#!/bin/bash

calendar=(
  # icon=cal
  # icon.font="$FONT:Bold:12.0"
  # icon.padding_right=0
  # icon.color=$RED
  # label.width=45
  label.font="$FONT:Bold:13.0"
  label.padding_top=0
  label.align=right
  label.color=$WHITE
  padding_right=4
  # padding_left=15
  update_freq=5
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
