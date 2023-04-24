#!/usr/bin/env bash

# theme
thm_bg0="#242831"
thm_bg1="#3B4252"
thm_fg="#E5E5E5"
thm_cyan="#2EB9D9"
thm_black="#151820"
thm_gray="#546178"
thm_magenta="#D873D3"
thm_pink="#f5c2e7"
thm_red="#F24C4F"
thm_green="#0ED090"
thm_yellow="#E9D165"
thm_blue="#4491E6"
thm_orange="#fab387"

main() {
  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  # status
  set status "on"
  set status-interval 5
  set status-bg "${thm_bg0}"
  set status-justify "centre"

  # panes
  set pane-border-style "fg=${thm_gray}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg0},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg0},none"

  # --------=== Statusline
  readonly show_tmux_name="#[fg=$thm_blue,bg=$thm_bg0]  tmux"

  readonly window_status=" #[fg=$thm_blue,bg=$thm_bg0]#I:#W "
  readonly window_status_current=" #[fg=$thm_blue,bg=$thm_bg0]#[fg=$thm_bg0,bg=$thm_blue] #I:#W #[fg=$thm_blue,bg=$thm_bg0]#[fg=$thm_blue,bg=$thm_bg0] "

  set status-left "${show_tmux_name}"
  set status-right "       " # equal to status-left length to center stuff
  
  setw window-status-format "${window_status}"
  setw window-status-current-format "${window_status_current}"
}

main "$@"

