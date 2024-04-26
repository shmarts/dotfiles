#!/bin/sh

desired_spaces=10
current_spaces="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

delta=0
while read -r line
do
  last_space="${line##* }"
  last_space=$((last_space + delta))
  existing_space_count="$(echo "$line" | wc -w)"
  missing_spaces=$((desired_spaces - existing_space_count))
  if [ "$missing_spaces" -gt 0 ]; then
    for i in $(seq 1 $missing_spaces)
    do
      yabai -m space --create "$last_space"
      last_space=$((last_space + 1))
    done
  elif [ "$missing_spaces" -lt 0 ]; then
    for i in $(seq 1 $((-missing_spaces)))
    do
      yabai -m space --destroy "$last_space"
      last_space=$((last_space - 1))
    done
  fi
  delta=$((delta + missing_spaces))
done <<< "$current_spaces"

sketchybar --trigger space_change --trigger windows_on_spaces


windows="$(yabai -m query --windows)"

maximise_window() {
  window_id="$1"
  echo "$window_id"
  yabai -m window "$window_id" --grid 1:1:0:0:1:1
}

center_window() {
  window_id="$1"
  display="$(yabai -m query --displays --window "$window_id" | jq '.frame')"
  display_width="$(jq --argjson display "${display}" -nr '$display.w | tonumber | floor')"
  display_height="$(jq --argjson display "${display}" -nr '$display.h | tonumber | floor')"

  new_width="$(jq --argjson display "${display}" -nr '$display.w | tonumber | floor / 1.3')"
  new_height="$(jq --argjson display "${display}" -nr '$display.h | tonumber | floor / 1.2')"
  yabai -m window "$window_id" --resize "abs:${new_width}:${new_height}"

  new_x=$(echo "$display_width $new_width" | awk '{print ($1 - $2) / 2}')
  new_y=$(echo "$display_height $new_height" | awk '{print ($1 - $2) / 2}')
  yabai -m window "$window_id" --move "abs:${new_x}:${new_y}"
}

move_app_to_space() {
  app_name="$1"
  space="$2"
  center="$3"
  app_index=0
  if [ -n "$4" ]; then
    app_index="$4"
  fi

  window_id="$(echo "$windows" |
    jq --arg app_name "$app_name" --argjson app_index "$app_index" 'nth($app_index; .[] | select(.app == $app_name)) | .id'
  )"
  if [ "$window_id" = "null" ]; then
    return
  fi

  if [ "$center" -eq 1 ]; then
    echo "Centering $app_name"
    center_window "$window_id"
  else
    echo "maximising $app_name"
    maximise_window "$window_id"
  fi
  echo "Moving $app_name to space $space"
  yabai -m window "$window_id" --space "$space"
}

move_app_to_space "Arc" 1 0
move_app_to_space "Code" 2 0 0
move_app_to_space "Code" 3 0 1
move_app_to_space "Obsidian" 4 1
move_app_to_space "Notes" 4 1
move_app_to_space "Slack" 5 1
move_app_to_space "Discord" 6 1
move_app_to_space "Spotify" 7 1
move_app_to_space "Messages" 8 1
move_app_to_space "Figma" 9 0
move_app_to_space "Notion" 10 1