#!/bin/bash

# CONFIG_DIR="$HOME/.config/sketchybar"
# source "$CONFIG_DIR/globals.sh"

sb_separator() {
	sepName="sep$RANDOM"
	sketchybar \
		--add item "$sepName" "$1" \
		--set "$sepName" \
		\
		label="───────" \
		padding_left="$2" \
		padding_right="$3" \
		icon.drawing=off \
		label.font.size=9.0 \
		label.color="$OX_DIM"
}

sb_clock() {
	sketchybar \
		--add item clock "$1" \
		--set clock \
		update_freq=5 \
		label.font.size=11 \
		label.font.style="Medium" \
		padding_left=4 \
		padding_right=8 \
		script="$PLUGIN_DIR/clock.sh"
}

sb_date() {
	sketchybar \
		--add item date "$1" \
		--set date \
		update_freq=120 \
		label.font.size=11 \
		label.font.style="Medium" \
		padding_left=2 \
		padding_right=8 \
		align=center \
		script="$PLUGIN_DIR/date.sh"
}

sb_month() {
	sketchybar \
		--add item month "$1" \
		--set month \
		update_freq=3000 \
		label.font.size=12 \
		label.font.style="Bold" \
		padding_left=2 \
		padding_right=8 \
		align=center \
		script="$PLUGIN_DIR/month.sh"
}

sb_spaces() {
	for sid in $(aerospace list-workspaces --all); do
		sketchybar --add item "space.$sid" "$1" \
			--subscribe "space.$sid" aerospace_workspace_change \
			--set "space.$sid" \
			background.drawing=on \
			background.color=0x00000000 \
			background.height=32 \
			label.padding_left=18 \
			label.padding_right=999 \
			label="$sid" \
			label.font.size=15 \
			label.font.style="Bold" \
			label.align=center \
			click_script="aerospace workspace $sid" \
			script="$CONFIG_DIR/plugins/aerospace.sh $sid"
	done
}

sb_wifi() {
	sketchybar \
		--add item wifi "$1" \
		--subscribe wifi wifi_change \
		--set wifi \
		\
		script="$PLUGIN_DIR/wifi.sh" \
		icon=􀙇 \
		label.color=$OX_DIM
}

sb_battery() {
	sketchybar \
		--add item battery "$1" \
		--subscribe battery system_woke power_source_change \
		--set battery \
		\
		script="$PLUGIN_DIR/battery.sh" \
		update_freq=120 \
		label.color=$OX_DIM
}

sb_volume() {
	sketchybar \
		--add item volume "$1" \
		--subscribe volume volume_change \
		--set volume \
		\
		script="$PLUGIN_DIR/volume.sh" \
		label.color=$OX_DIM
}
