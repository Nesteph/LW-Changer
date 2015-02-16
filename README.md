# LW-Changer

Basic version for now.

Checks for a newer image at a specified location and downloads it into Yosemite's login screen image location.

Basic Usage:
1) To set the image location to check against, modify the script
  in /Library/LWChanger/LoginWindowDownload.sh to point at the
  image url you want to compare against.

2) At machine start up and once every 5 minutes it will check
   against the URL to see if a newer version is available, and
   if so, download it.
