#!/bin/bash

display="$(yabai -m query --displays --window | jq '.frame')"
display_width="$(jq --argjson display "${display}" -nr '$display.w')"
display_height="$(jq --argjson display "${display}" -nr '$display.h')"

window="$(yabai -m query --windows --window | jq '.frame')"
window_width="$(jq --argjson window "${window}" -nr '$window.w')"

window_gap=6
max_window_width=$((display_width - window_gap * 2))

if [[ $window_width -eq $max_window_width ]]; then
  new_width="$(jq --argjson display "${display}" -nr '$display.w / 1.3')"
  new_height="$(jq --argjson display "${display}" -nr '$display.h / 1.2')"
  yabai -m window --resize "abs:${new_width}:${new_height}"

  new_x=$(echo "$display_width $new_width" | awk '{print ($1 - $2) / 2}')
  new_y=$(echo "$display_height $new_height" | awk '{print ($1 - $2) / 2}')
  yabai -m window --move "abs:${new_x}:${new_y}"
else
  yabai -m window --grid 1:1:0:0:1:1
fi
