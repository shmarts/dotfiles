#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=6
    icon.padding_right=6
    padding_left=0
    padding_right=0
    # label.padding_right=20
    icon.highlight_color=$WHITE
    label.color=$WHITE
    label.highlight_color=$WHITE
    # label.font="sketchybar-app-font:Regular:16.0"
    # label.y_offset=-1
    background.color=$BG_D
    # background.border_color=$PURPLE
    background.drawing=off
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

spaces_bracket=(
  background.color=$PURPLE
  background.border_color=$CYAN
)

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=1
  padding_right=1
  label.drawing=off
  associated_display=active
  click_script='yabai -m space --create && sketchybar --trigger space_change'
  icon.color=$WHITE
)

# sketchybar --add bracket spaces_bracket '/space\..*/'  \
#            --set spaces_bracket "${spaces_bracket[@]}" \
#                                                        \
#            --add item separator left                   \
#            --set separator "${separator[@]}"
