#!/bin/sh

# Read in settings from config
imageURL=`defaults read /Library/Preferences/LWChanger.plist imageURL`
NumToBackup=`defaults read /Library/Preferences/LWChanger.plist NumToBackup`
BackupLocation=`defaults read /Library/Preferences/LWChanger.plist BackupLocation`
FrequencyCheck=`defaults read /Library/Preferences/LWChanger.plist FrequencyCheck`

# Make Backup Folder if it doesn't exist
if [ ! -d $BackupLocation ]; then
  mkdir -p $BackupLocation
fi

# Update LaunchDaemon to match config settings
# launchd modification here

# Download the latest image if the Modify date is newer than our current login window background.
if [[ "$(curl $imageURL -z /Library/LWChanger/com.apple.desktop.admin.png -o /Library/LWChanger/com.apple.desktop.admin.png -s -L -w %{http_code})" == "200" ]]; then

  # Check to see if any backups need to be kept
  if [ $NumToBackup != 0 ]; then

    # Make loop counter for number of backup images to keep
    Num=`echo "$(($NumToBackup-1))"`

    # Loop through existing backups and move them for newer incoming image
    for (($Num; $Num>0; Num--)); do
      
      # Checks to see if a backup already exists, and if it does, moves it for the new one
      if [ -e "$BackupLocation/$Num.com.apple.desktop.admin.png" ]; then
        next=$BackupLocation/`echo "$(($Num+1))"`.com.apple.desktop.admin.png
        mv "$BackupLocation/$Num.com.apple.desktop.admin.png" $next
      fi
      
    done
    
    # Backup the current image to the backup location
    cp /Library/Caches/com.apple.desktop.admin.png "$BackupLocation/1.com.apple.desktop.admin.png"
    
  fi
  
  # Make the downloaded image the login wallpaper
  cp /Library/LWChanger/com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png
  
fi

# Move the downloaded image to the current wallpaper there isn't one there already
if [ ! -e "/Library/Caches/com.apple.desktop.admin.png" ]; then
  if [ -e "/Library/LWChanger/com.apple.desktop.admin.png" ]; then
    cp /Library/LWChanger/com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png
  fi
fi