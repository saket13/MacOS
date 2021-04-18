#!/bin/bash
function cloudOn {
        launchctl load /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
        launchctl load /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist
        sudo launchctl load /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist
        sudo launchctl load /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
}
function cloudOff {
        launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
        launchctl unload /System/Library/LaunchAgents/com.apple.nsurlsessiond.plist
        sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlsessiond.plist
        sudo launchctl unload /System/Library/LaunchDaemons/com.apple.nsurlstoraged.plist
}
if [ -z "$1" ]; then
echo "Usage: $0 on | off"
elif [ "$1" == "on" ]; then
echo "Switching cloud on.."
        cloudOn
elif [ "$1" == "off" ]; then
echo "Switching cloud off.."
        cloudOff
else
echo "Invalid argument"
echo "Usage: $0 on | off"
fi
