# wallpaper_rotate

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


