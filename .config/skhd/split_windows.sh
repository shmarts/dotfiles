#!/bin/bash

direction="$1"
is_left=1
if [[ "$direction" == "right" ]]; then
  is_left=0
fi

# TODO https://github.com/koekeishiya/yabai/wiki/Commands#modify-padding-and-gaps instead of gap management?

display_width=$(yabai -m query --displays --window | jq -r '.frame.w | tonumber | floor')
window_gap=6
half_window_gap=$((window_gap / 2))
available_space=$((display_width - window_gap * 2))
half_window_width=$((available_space / 2 - half_window_gap))
two_thirds_window_width=$((available_space * 2 / 3 - half_window_gap))
one_third_window_width=$((available_space / 3 - half_window_gap))

focused=$(yabai -m query --windows --window)
focused_id=$(echo "$focused" | jq '.id')
focused_width=$(echo "$focused" | jq '.frame.w | tonumber | floor')
echo ""
echo "$focused_width"
echo "$half_window_width"
is_not_half=$((focused_width < half_window_width - 5 || focused_width > half_window_width + 5))

# <rows>:<cols>:<start-x>:<start-y>:<width>:<height>

resize_focused_window () {
  width=$half_window_width
  if [ "$is_not_half" -eq 0 ]; then
    width=$two_thirds_window_width
  fi

  start_x=0
  if [ "$is_left" -eq 0 ]; then
    if [ "$is_not_half" -eq 0 ]; then
      start_x=$((one_third_window_width + window_gap))
    else
      start_x=$((width + window_gap))
    fi
  fi

  yabai -m window "$focused_id" --grid 1:$available_space:$start_x:0:$width:1
}

resize_unfocused_window () {
  difference=$half_window_width
  width=$half_window_width

  if [ "$is_not_half" -eq 0 ]; then
    difference=$two_thirds_window_width
    width=$one_third_window_width
  fi

  start_x=$((difference + window_gap))
  if [ "$is_left" -eq 0 ]; then
    start_x=0
  fi

  yabai -m window "$1" --grid 1:$available_space:$start_x:0:$width:1;
}

resize_focused_window

yabai -m query --windows --space |
jq -r '.[] | select(."has-focus" == false).id' |
while read -r id; do resize_unfocused_window "$id"; done
