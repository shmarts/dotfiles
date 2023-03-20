#!/bin/bash
############################
# install.sh
############################

# TODO:
# - Prettier logging

DOTFILES=$(pwd -P)

# Brew taps
brew tap homebrew/cask-fonts

# Brew formulae
brew install exa
brew install starship
brew install sketchybar
brew install lazygit
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install fnm

# Brew casks
brew install --cask font-fira-code-nerd-font
brew install --cask alacritty

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