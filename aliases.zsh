# ALIASES
alias l='exa -lah'
alias ls='exa'
alias sl='exa'
alias lg='lazygit'

# FUNCTIONS
function mkcd() {
    mkdir -p "$1" && cd "$1"
}