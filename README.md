# wallpaper_rotate 
Scripts to make screensavers interesting under Linux. By switching between several themed folders, the 
screensave has a different feel each day. 

## wallpaper_rotate.sh
Under Linux, rotate amongst a number of folders under Pictures so that each day has a different set of pictures. 

Under the ~/Pictures folder, candidate folders end in two underscores__. The script maintains a symbolic link called "wallpapers" which points to a different peer folder each day. 

```
$ ll ~/Pictures/ | egrep 'wallp|__'
drwxr-xr-x. 2 banzlova rca     4096 Apr 16 09:33 abandoned__
drwx------. 2 banzlova rca    12288 Apr 16 14:56 art__
drwx------. 2 banzlova rca     4096 Apr 16 09:33 aww__
drwx------. 2 banzlova rca     4096 Apr 16 10:48 earth__
drwx------. 2 banzlova rca     4096 Apr 16 10:50 infographics__
drwx------. 3 banzlova rca     4096 Apr 16 11:44 landscapes__
drwx------. 2 banzlova rca     8192 Apr 16 10:46 maps__
drwx------. 2 banzlova rca     8192 Apr 12 14:31 space__
drwx------. 2 banzlova rca     4096 Apr 16 10:45 vwallpapers__
lrwxrwxrwx. 1 root     root      27 Apr 17 03:35 wallpapers -> /local/rca/Pictures/earth_
```

The file wallpaper_rotate.sh can be loaded into /etc/cron.daily 

## xkcdclock.sh
Based on the time, this determines which of 48 clock images should be symlinked into each of the 
wallpaper rotation directories above. In this fashion, the XKCD clock becomes a member of each of the
picture sets while being maintained every 15 minutes. 

## ytimage.sh 
Pull the image from a youtube video, 
Usage: ytimage.sh https://youtube.com/v=1v2v34v4v5
creates a file called YT_1v2v3v4v5.jpg using the highest possible resolution
