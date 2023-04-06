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

# Brew installs
if [[ "$install_dependencies" -eq 1 ]]; then
  # Brew taps
  brew tap homebrew/cask-fonts
  # Brew formulae
  brew install exa
  brew install jq
  brew install ripgrep
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
  # Brew casks
  brew install --cask font-fira-code-nerd-font
  brew install --cask alacritty
fi

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

echo ''
echo 'Done!'
