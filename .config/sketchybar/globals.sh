#!/bin/bash

export PLUGIN_DIR="$HOME/.config/sketchybar/plugins"
export OX_BG="0xffff0000"
export OX_FG="0xffff0000"
export OX_DIM="0xff798791"
export OX_MG="0xff798791"
export OX_ORG="0xfff99286"
export SPACE_ICONS=("􀊴" "􀌃" "􀨁" "􀢅" "􀰬" "􀧶" "􁸅" "􀟆" "􁷯")

export SB_BAR=(
  position=right
  height=44
  sticky=on
  topmost=window
  y_offset=0
  margin=0
  color=0xff20242A
  border_width=0
  border_color=0xffff0000
  font_smoothing=on
  padding_left=0
  padding_right=0
)

export SB_DEFAULT=(
  icon.font.family="SF Pro"
  icon.font.style="Regular"
  icon.font.size=14
  icon.color="$OX_DIM"
  label.font="FiraCode Nerd Font"
  label.font.style="Regular"
  label.font.size=14
  label.color="$OX_MG"
  padding_left=0
  padding_right=0
  label.padding_left=0
  label.padding_right=0
  icon.padding_left=0
  icon.padding_right=0
  icon.highlight_color="$OX_MG"
)
