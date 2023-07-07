#!/bin/bash

# direction = $1
# echo $direction

display_width="$(system_profiler SPDisplaysDataType | grep 'Resolution:' | head -n 1 | awk '{print $2}')"
window_gap=6
half_window_gap=$((window_gap / 2))
available_space=$((display_width - window_gap * 2))
half_window_width=$((available_space / 2 - half_window_gap))

two_thirds_window_width=$((available_space * 2 / 3 - half_window_gap))
one_third_window_width=$((available_space / 3 - half_window_gap))

focused=$(yabai -m query --windows --window)
focused_id=$(echo "$focused" | jq '.id')
focused_width=$(echo "$focused" | jq '.frame.w')
is_not_half=$((focused_width != half_window_width))

# <rows>:<cols>:<start-x>:<start-y>:<width>:<height>

resize_focused_window () {
  if [ "$is_not_half" -eq 1 ]
  then
    yabai -m window "$focused_id" --grid 1:$available_space:0:0:$half_window_width:1
  else
    yabai -m window "$focused_id" --grid 1:$available_space:0:0:$two_thirds_window_width:1
  fi
}

resize_unfocused_window () {
  if [ "$is_not_half" -eq 1 ]
  then
    start_x=$((half_window_width + window_gap))
    yabai -m window "$1" --grid 1:$available_space:$start_x:0:$half_window_width:1;
  else
    start_x=$((two_thirds_window_width + window_gap))
    yabai -m window "$1" --grid 1:$available_space:$start_x:0:$one_third_window_width:1;
  fi
}

resize_focused_window

yabai -m query --windows --space |
jq -r '.[] | select(."has-focus" == false).id' |
while read -r id; do resize_unfocused_window "$id"; done
