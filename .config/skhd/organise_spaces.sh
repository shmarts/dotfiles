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

move_app_to_space() {
  app_name="$1"
  space="$2"
  app_index=0
  if [ -n "$3" ]; then
    app_index="$3"
  fi

  window_id="$(echo "$windows" |
    jq --arg app_name "$app_name" --argjson app_index "$app_index" 'nth($app_index; .[] | select(.app == $app_name)) | .id'
  )"
  if [ "$window_id" = "null" ]; then
    return
  fi

  yabai -m window "$window_id" --space "$space"
}

move_app_to_space "Arc" 1
move_app_to_space "Code" 2 0
move_app_to_space "Code" 3 1
move_app_to_space "Obsidian" 4
move_app_to_space "Notes" 4
move_app_to_space "Slack" 5
move_app_to_space "Discord" 6
move_app_to_space "Spotify" 7
move_app_to_space "Messages" 8
move_app_to_space "Figma" 9
move_app_to_space "Notion" 10