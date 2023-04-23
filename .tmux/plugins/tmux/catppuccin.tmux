#!/usr/bin/env bash

# thm_black="#151820"
# thm_bg0="#2B303A"
# thm_bg1="#2E3440"
# thm_bg2="#3B4252"
# thm_bg3="#434C5E"
# thm_bg_d="#242831"
# thm_bg_blue="#6db9f7"
# thm_bg_yellow="#f0d197"
# thm_fg="#c0c5ce"
# thm_purple="#B48EAD"
# thm_green="#AFCF96"
# thm_orange="#DE935F"
# thm_brown="#C88270"
# thm_blue="#81A2BE"
# thm_yellow="#EBCB8B"
# thm_cyan="#96B5B4"
# thm_red="#E66464"
# thm_grey="#546178"
# thm_white="#EFF1F5"
# thm_dark_cyan="#25747d"
# thm_dark_red="#a13131"
# thm_dark_yellow="#9a6b16"
# thm_dark_purple="#8f36a9"
# thm_diff_add="#0ED090"
# thm_diff_delete="#F24C4F"
# thm_diff_change="#E9D165"
# thm_diff_text="#265478"
    # black:   '#000000'
    # red:     '#F24C4F'
    # green:   '#0ED090'
    # yellow:  '#E9D165'
    # blue:    '#4491E6'
    # magenta: '#D873D3'
    # cyan:    '#2EB9D9'
    # white:   '#E5E5E5'

thm_bg="#2B303A"
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
thm_black4="#585b70"


main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

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
  set status-interval 2
  set status-bg "${thm_bg}"
  set status-justify "centre"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_blue},bg=${thm_bg},align=centre"
  set message-command-style "fg=${thm_cyan},bg=${thm_gray},align=centre"

  # panes
  set pane-border-style "fg=${thm_gray}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  # --------=== Statusline

  # NOTE: Checking for the value of @window_tabs_enabled
  wt_enabled="$(get-tmux-option "@window_tabs_enabled" "off")"
  readonly wt_enabled

  # These variables are the defaults so that the setw and set calls are easier to parse.
  #readonly show_directory="#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_blue,bg=$thm_gray]  #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} #{?client_prefix,#[fg=$thm_red]"
  #readonly show_session="#[bg=$thm_magenta]}#[fg=$thm_bg] #S#[fg=$thm_magenta,bg=$thm_bg]#[fg=$thm_magenta,bg=$thm_bg]"
  readonly show_directory_in_window_status="#[fg=$thm_bg,bg=$thm_blue]#I #[fg=$thm_blue,bg=$thm_gray] #{b:pane_current_path}"
  readonly show_directory_in_window_status_current="#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path}"
 # readonly show_window_in_window_status="#[fg=$thm_fg,bg=$thm_bg] #W #[fg=$thm_bg,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
 # readonly show_window_in_window_status_current="#[fg=$thm_fg,bg=$thm_gray] #W #[fg=$thm_bg,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
  readonly show_window_in_window_status="#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_black4,bg=$thm_orange]#{b:pane_current_path} #[fg=$thm_black4,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_orange,bg=$thm_bg] "
  readonly show_tmux_logo="#[fg=$thm_orange,bg=$thm_gray]#[fg=$thm_yellow,bg=$thm_orange] #[fg=$thm_yellow,bg=$thm_orange] #[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_orange,bg=$thm_bg] "
  #readonly show_tmux_name="#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_blue,bg=$thm_orange]Tmux#[fg=$thm_blue,bg=$thm_orange] #[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_orange,bg=$thm_bg] "
  readonly show_tmux_name="#[fg=$thm_blue,bg=$thm_bg] Tmux  #[fg=$thm_blue,bg=$thm_bg]"
  readonly show_window_in_window_status_current="#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_bg,bg=$thm_blue]#{b:pane_current_path} #[fg=$thm_bg,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_blue,bg=$thm_bg] "
 # readonly show_window_in_window_status="#[fg=$thm_blue,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_blue,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} #[fg=$thm_bg,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "
 # readonly show_window_in_window_status_current="#[fg=$thm_orange,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_orange,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} #[fg=$thm_bg,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg]#[fg=$thm_fg,bg=$thm_bg,nobold,nounderscore,noitalics] "

  # Right column 1 by default shows the Window name.
  local right_column1=$show_window

  # Right column 2 by default shows the current Session name.
  local right_column2=$show_session

  local left_column1=$show_tmux_logo
  local left_column2=$show_tmux_name

  # Window status by default shows the current directory basename.
  #local window_status_format=$show_directory_in_window_status
  #local window_status_current_format=$show_directory_in_window_status_current
  local window_status_format=$show_window_in_window_status
  local window_status_current_format=$show_window_in_window_status_current

  # NOTE: With the @window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]
  then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  set status-left "${show_tmux_name}"

  set status-right "${right_column1}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_pink} bg=${thm_black4} bold"
}

main "$@"
