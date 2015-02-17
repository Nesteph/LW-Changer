#!/bin/sh

# Read in settings from config
imageURL=`defaults read /Library/Preferences/LWChanger.plist imageURL`
NumToBackup=`defaults read /Library/Preferences/LWChanger.plist NumToBackup`
BackupLocation=`defaults read /Library/Preferences/LWChanger.plist BackupLocation`
FrequencyCheck=`defaults read /Library/Preferences/LWChanger.plist FrequencyCheck`

# Update LaunchDaemon to match config settings
# launchd modification here

# Download the latest image if the Modify date is newer than our current login window background.
curl -z /Library/Caches/com.apple.desktop.admin.png $imageURL > /Library/LWChanger/com.apple.desktop.admin.png

# Check to see if the updated image has been downloaded, if so, move it to 
if [ -e "/Library/LWChanger/com.apple.desktop.admin.png" ]; then
  
  # Check to see if any backups need to be kept
  if [ $NumToBackup != 0 ]; then
    
    # Make loop counter for number of backup images to keep
    Num=echo "$((NumToBackup-1))"

    # Loop through existing backups and move them for newer incoming image
    for (($Num; $Num>0; Num--)); do

      # Checks to see if a backup already exists, and if it does, moves it for the new one
      if [ -e "$BackupLocation/com.apple.desktop.admin.png.$Num"]; then
        next=$BackupLocation/com.apple.desktop.admin.png.`echo "$(($Num+1))"`
        mv "$BackupLocation/com.apple.desktop.admin.png.$Num" $next
      fi
    done
    # Backup the current image to the backup location
    mv /Library/Caches/com.apple.desktop.admin.png "$BackupLocation/com.apple.desktop.admin.png.1"
  fi
  
  # Move the image downloaded earlier to be used for the login window background
  mv /Library/LWChanger/com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png
fi