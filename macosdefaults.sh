# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool false
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# Set dock autohide speed to 0
defaults write com.apple.dock autohide-delay -float 0
