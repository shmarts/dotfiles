#!/bin/bash
############################
# install.sh
############################

# TODO:
# - Prettier logging

DOTFILES=$(pwd -P)

# Parse arguments
install_dependencies=1
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -sd|--skip-dependencies)
      install_dependencies=0
      ;;
    *)
      error "Invalid command line flag $1" >&2
      exit 1
      ;;
  esac
  shift
done

# Make symlinks in homedir
files=($(git ls-tree --name-only main))
echo "...done"
echo "Changing to the $DOTFILES directory"
cd $DOTFILES
echo "...done"
for file in ${files[@]}; do
  if [[ "$file" =~ ^(.gitignore|install.sh|macosdefaults.sh|wallpapers)$ ]]; then continue ; fi
  echo "Creating symlink to $file in home directory."
  ln -sfn $DOTFILES/$file ~/$file
done

# Dependency installs
if [[ "$install_dependencies" -eq 1 ]]; then
  # Brew taps
  brew tap homebrew/cask-fonts
  # Brew formulae
  brew install eza
  brew install jq
  brew install ripgrep
  brew install fzf
  brew install starship
  brew install sketchybar
  brew install lazygit
  brew install zsh-autosuggestions
  brew install zsh-syntax-highlighting
  brew install go
  brew install rust
  brew install pnpm
  brew install fnm
  brew install mprocs
  brew install golangci-lint
  brew install tmux
  # Brew casks
  brew install MonitorControl
  brew install --cask font-fira-code-nerd-font
  brew install --cask kitty
  brew install --cask raycast
  brew install --cask alt-tab
  brew install --cask hammerspoon
  # Other
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  curl -fsSL https://bun.sh/install | bash
fi

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.6/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# .env.sh file
create_env_file () {
  if test -f "$HOME/.env.sh"; then
    echo "$HOME/.env.sh file already exists, skipping"
  else
    echo "export DOTFILES=$DOTFILES" > $HOME/.env.sh
    echo 'created ~/.env.sh'
  fi
}
create_env_file

# scripts
setup_scripts () {
  echo 'Setting up scripts...'
  scripts_dir=$DOTFILES/bin
  for file in $scripts_dir/*; do
    chmod u+r+x $file
  done
  echo 'Scripts set up'
}
setup_scripts

# symlinks
ln -sfn $DOTFILES/.tmux/tmux-sessionizer ~/bin/tmux-sessionizer

echo ''
echo 'Done!'
