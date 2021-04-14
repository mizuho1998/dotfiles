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
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>65535</integer><integer>48</integer><integer>524288</integer></array><key>type</key><string>standard</string></dict></dict>"

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


# Rectangle
defaults write com.knollsoft.Rectangle SUEnableAutomaticChecks -int 0
defaults write com.knollsoft.Rectangle SUHasLaunchedBefore -int 1
defaults write com.knollsoft.Rectangle almostMaximize -dict keyCode 5 modifierFlags 786432
defaults write com.knollsoft.Rectangle bottomHalf -dict keyCode 38 modifierFlags 786432
defaults write com.knollsoft.Rectangle bottomLeft -dict keyCode 32 modifierFlags 786432
defaults write com.knollsoft.Rectangle bottomRight -dict keyCode 34 modifierFlags 786432
defaults write com.knollsoft.Rectangle centerThird -dict keyCode 46 modifierFlags 786432
defaults write com.knollsoft.Rectangle firstThird -dict keyCode 45 modifierFlags 786432
defaults write com.knollsoft.Rectangle firstTwoThirds -dict keyCode 47 modifierFlags 786432
defaults write com.knollsoft.Rectangle lastThird -dict keyCode 43 modifierFlags 786432
defaults write com.knollsoft.Rectangle lastTwoThirds -dict keyCode 44 modifierFlags 786432
defaults write com.knollsoft.Rectangle lastVersion -dict keyCode 49 modifierFlags 786432
defaults write com.knollsoft.Rectangle maximize -dict keyCode 3 modifierFlags 786432
defaults write com.knollsoft.Rectangle maximizeHeight -dict keyCode 9 modifierFlags 786432
defaults write com.knollsoft.Rectangle nextDisplay -dict keyCode 124 modifierFlags 917504
defaults write com.knollsoft.Rectangle previousDisplay -dict keyCode 123 modifierFlags 917504
defaults write com.knollsoft.Rectangle rightHalf -dict keyCode 37 modifierFlags 786432
defaults write com.knollsoft.Rectangle topHalf -dict keyCode 40 modifierFlags 786432
defaults write com.knollsoft.Rectangle topLeft -dict keyCode 16 modifierFlags 786432
defaults write com.knollsoft.Rectangle topRight -dict keyCode 31 modifierFlags 786432
