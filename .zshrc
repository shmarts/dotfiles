export XDG_CONFIG_HOME="$HOME/.config"

# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/martin/completions:"* ]]; then export FPATH="/Users/martin/completions:$FPATH"; fi
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

export FZF_DEFAULT_OPTS='--color=fg:#546178,bg:-1,hl:#4491E6
--color=fg+:#e5e5e5,bg+:-1,hl+:#4491E6
--color=info:#e5e5e5,prompt:#0ED090,pointer:#e5e5e5
--color=marker:#0ED090,spinner:#af5fff,header:#af5fff'

export CLOUDSDK_PYTHON="/opt/homebrew/bin/python3.11"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/martin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/martin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/martin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/martin/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/martin/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
precmd() { precmd() { echo "" } }

# bun completions
[ -s "/Users/martin/.bun/_bun" ] && source "/Users/martin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-06-02 14:08:34
export PATH="$PATH:/Users/martin/.local/bin"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
