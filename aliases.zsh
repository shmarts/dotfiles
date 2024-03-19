# ALIASES
alias l='eza -lah'
alias ls='eza'
alias sl='eza'
alias lg='lazygit'
alias v='nvim'
# PROJECTS
alias dotfiles='cd ~/dotfiles'
alias krunker='cd ~/code/frvr/game-krunker-frvr'
alias crucible='cd ~/code/frvr/frvr-crucible'

# SCRIPTS
alias tm='tmux-sessionizer'

# FUNCTIONS
function mkcd() {
  mkdir -p "$1" && cd "$1"
}
function kports() {
  lsof -nti:$1 | xargs kill -9
}

