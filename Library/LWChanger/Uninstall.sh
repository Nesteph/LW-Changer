#!/bin/sh

launchctl unload /Library/LaunchDaemons/LWChanger.plist

rm /Library/LaunchDaemons/LWChanger.plist
rm /Library/Preferences/LWChanger.plist
rm -rf /Library/LWChanger