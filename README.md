# LW-Changer

Checks for an image at a specified URL and sets it as the Login wallpaper in Yosemite.

#####Basic Usage:
- To set the image location to check against, `defaults write /Library/Preferences/LWChanger.plist imageURL <url>` to point at the image url you want to compare against.
- To set how many backups you want to keep, `defaults write /Library/Preferences/LWChanger.plist NumToBackup <number>`
- Currently, at machine start up and once every 5 minutes it will check against the URL to see if a newer version is available, and if so, download it.

Download is avaliable **[here](https://github.com/Nesteph/LW-Changer/releases)**.


#####Planned features:
- Allowing the user to set the checking frequency
- Adding a forced download option

#####Possible features:
- Support for 10.7 through 10.9
