#!/bin/bash
############################
# install.sh
############################

# Brew taps
brew tap homebrew/cask-fonts

# Brew formulae
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Brew casks
brew install --cask font-fira-code-nerd-font
brew install --cask alacritty

# Make symlinks in homedir
dir=~/dotfiles                    # dotfiles directory
files=($(git ls-tree --name-only main))
echo "...done"
echo "Changing to the $dir directory"
cd $dir
echo "...done"
for file in ${files[@]}; do
    if [[ "$file" =~ ^(.gitignore|install.sh|macosdefaults.sh|wallpapers)$ ]]; then continue ; fi
    echo "Creating symlink to $file in home directory."
    ln -sfn $dir/$file ~/$file
done
