#!/bin/bash
LONGOPTION_LIST=(
    "term-path"
)
OPTION_LIST=(
    "term-path"
)
opts=$(getopt \
    --longoptions "$(printf "%s:," "${LONGOPTION_LIST[@]}")" \
    --options "$(printf "%s:," "${OPTION_LIST[@]}")" \
    -- "$@"
)

TERM_PATH='./';
eval set --$opts
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p | --term-path)
            TERM_PATH=$2
            shift 2
            ;;
        *) shift ;;
    esac
done

# dock
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock magnification -int 0
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock "minimize-to-application" -int 1
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock "show-process-indicators" -int 1
defaults write com.apple.dock "show-recents" -int 0
defaults write com.apple.dock tilesize -int 40

# keyboard
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# mouse

# trackpad
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -int 3
defaults write "com.apple.AppleMultitouchTrackpad" FirstClickThreshold -int 0
defaults write "com.apple.AppleMultitouchTrackpad" SecondClickThreshold -int 0

# bluetooth
defaults write  "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 1

# battery
defaults write "com.apple.menuextra.battery" ShowPercent -string "YES"

# clock
defaults write "com.apple.menuextra.clock" DateFormat -string "M\\U6708d\\U65e5(EEE)  H:mm";
defaults write "com.apple.menuextra.clock" FlashDateSeparators -int 0
defaults write  "com.apple.menuextra.clock" IsAnalog -int 0

# menu extra
defaults write "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.clock" -int 1
defaults write "com.apple.systemuiserver" menuExtras -array \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# finder
defaults write "com.apple.finder" NewWindowTarget -string "PfHm"
defaults write "com.apple.finder" NewWindowTargetPath -string "file://${HOME}/"
defaults write "com.apple.finder" ShowExternalHardDrivesOnDesktop -int 1
defaults write "com.apple.finder" ShowHardDrivesOnDesktop -int 0
defaults write "com.apple.finder" ShowMountedServersOnDesktop -int 0
defaults write "com.apple.finder" ShowRemovableMediaOnDesktop -int 1
defaults write NSGlobalDomain AppleShowAllExtensions -int 1
defaults write NSGlobalDomain FXEnableExtensionChangeWarning -int 1

# terminal
TERM_PROFILE='custom';
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
    echo "${TERM_PATH}"
    open "$TERM_PATH$TERM_PROFILE.terminal"
    defaults write com.apple.Terminal "Default Window Settings" -string "$TERM_PROFILE"
    defaults write com.apple.Terminal "Startup Window Settings" -string "$TERM_PROFILE"
fi
defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
