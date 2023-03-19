# ALIASES
alias l='exa -lah'
alias ls='exa'
alias sl='exa'

# FUNCTIONS
function mkcd() {
    mkdir -p "$1" && cd "$1"
}