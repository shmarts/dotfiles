# ALIASES
alias l='exa -lah'
alias ls='exa'
alias sl='exa'
alias lg='lazygit'

# PROJECTS
alias dotfiles='cd ~/dotfiles'
alias krunker='cd ~/code/frvr/game-krunker-frvr'
alias crucible='cd ~/code/frvr/frvr-crucible'

# FUNCTIONS
function mkcd() {
  mkdir -p "$1" && cd "$1"
}
function kports() {
  lsof -nti:$1 | xargs kill -9
}

