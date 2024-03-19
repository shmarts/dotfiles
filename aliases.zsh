# ALIASES
alias l='eza -lah'
alias ls='eza'
alias sl='eza'
alias lg='lazygit'
alias v='nvim'
alias rmnpm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
alias fman="compgen -c | fzf | xargs man"

# SCRIPTS
alias tm='tmux-sessionizer'

# FUNCTIONS
function mkcd() {
  mkdir -p "$1" && cd "$1"
}
function kports() {
  lsof -nti:$1 | xargs kill -9
}

