# Plugins
[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
                                                  || source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -d "/opt/homebrew/share/zsh-syntax-highlighting/highlighters" ] && export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters \
                                                                  || export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

[ -d "/opt/homebrew/share/zsh-autosuggestions/" ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
                                                  || source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

setopt autocd

source $HOME/.env.sh
source $DOTFILES/aliases.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/martin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/martin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/martin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/martin/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
precmd() { precmd() { echo "" } }