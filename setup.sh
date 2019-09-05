#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Install Homebrew and a bunch of apps.
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update

brew cask install \
    slack \
    alfred \
    moom \
    spotify \
    iterm2 \
    firefox \
    1password \
    visual-studio-code \
    little-snitch \
    docker \
    dash

brew install \
    bash \
    kubectx \
    fzf \
    bat \
    awscli \
    aws-iam-authenticator \
    kubernetes-cli \
    kubernetes-helm \
    node \
    python \
    ruby \
    terraform \
    stern \
    jq \
    bash-completion@2 \
    git \
    rename

# Close any open System Preferences panes, to prevent them from overriding settings we’re about to change.
osascript -e 'tell application "System Preferences" to quit'

# Show hidden files in Finder.
defaults write com.apple.finder AppleShowAllFiles YES

# Show all file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show scrollbars.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Disable Notification Center and remove the menu bar icon.
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null

# Enable tap to click for this user and for the login screen.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Stop iTunes from responding to the keyboard media keys.
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null

# Disable automatic emoji substitution in iMessage.
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Prevent Photos from opening automatically when devices are plugged in.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Enable the automatic update check for App Store.
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Download updates from App Store in the background.
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Show all processes in Activity Monitor.
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage.
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Wipe all app icons from the Dock.
# This is only really useful when setting up a new Mac, or if you don’t use the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock.
defaults write com.apple.dock static-only -bool true

# Don’t animate opening applications from the Dock.
defaults write com.apple.dock launchanim -bool false

# Disable Dashboard.
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space.
defaults write com.apple.dock dashboard-in-overlay -bool true

# Remove the animation when hiding/showing the Dock.
defaults write com.apple.dock autohide-time-modifier -float 0

# Remove the auto-hiding Dock delay.
defaults write com.apple.dock autohide-delay -float 0

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent.
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock.
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers).
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons.
defaults write com.apple.finder QuitMenuItem -bool true

# Set Desktop as the default location for new Finder windows.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show icons for hard drives, servers, and removable media on the desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show hidden files in Finder by default.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions in Finder.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder.
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar in Finder.
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# In Finder, keep folders on top when sorting by name.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# In Finder, when performing a search, search the current folder by default.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default.
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash.
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder in Finder.
chflags nohidden ~/Library

# Show the /Volumes folder in Finder.
sudo chflags nohidden /Volumes

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop.
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF).
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots.
defaults write com.apple.screencapture disable-shadow -bool true

# Enable lid wakeup.
sudo pmset -a lidwake 1

# Restart automatically on power loss.
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes.
sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes.
sudo pmset -a displaysleep 15

# Disable machine sleep while charging.
sudo pmset -c sleep 0

# Set machine sleep to 5 minutes on battery.
sudo pmset -b sleep 5

# Set standby delay to 24 hours (default is 1 hour).
sudo pmset -a standbydelay 86400

# Never go into computer sleep mode.
sudo systemsetup -setcomputersleep Off >/dev/null

# Disable hibernation mode (speeds up entering sleep mode).
sudo pmset -a hibernatemode 0

# Increase sound quality for Bluetooth headphones.
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable press-and-hold for keys in favor of key repeat.
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set language and text formats.
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false

# Set the timezone; see `sudo systemsetup -listtimezones` for other values.
sudo systemsetup -settimezone "America/Los_Angeles" >/dev/null

# Automatically quit printer app once the print jobs complete.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window.
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Disable Notification Center and remove the menu bar icon.
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null

# Disable automatic capitalization as it’s annoying when typing code.
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code.
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

# More macOS options are available here:
# https://ss64.com/osx/syntax-defaults.html
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

cp .bash_completion ~/.bash_completion
cp .bash_profile ~/.bash_profile
cp .bashrc ~/.bashrc
cp .fzf.bash ~/.fzf.bash
cp .git ~/.git
cp .gitconfig ~/.gitconfig
cp .vimrc ~/.vimrc

echo "It's time to set your default shell to the newer version of bash."
echo "Edit your /etc/shells file to include this line (you may need to enter sudo-mode):"
echo
echo "/usr/local/bin/bash"
echo
echo "Then, run 'chsh -s /usr/local/bin/bash'. You will be prompted for your macOS password."
