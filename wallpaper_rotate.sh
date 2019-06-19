#!/bin/sh
# change the symlink to screensavers directory
# this allows a rotating selection of directories 
#
# screensaver definitions can be found in /usr/share/applications/screensavers
# (your distribution may vary). You want to change the directory where it looks
# for pictures. The line might look like this when you're done, minus the comment
#Exec=/usr/libexec/mate-screensaver/slideshow --location=/local/rca/Pictures/wallpapers

# top dir of pictures
PICDIR=/local/rca/Pictures

# where is the symlink
my_link=$PICDIR/wallpapers

# now your screen saver will pull from whatever is in the wallpapers directory or 
# whatever directory it points to, if it's a symbolic link 
# The rest of the script will determine which subdirectories can be 
# underscore in the name somewheere

# create empty array to hold the directories we're interested in
subdirs=()
for f in $PICDIR/*__*; do
    # strip all but the directory name
    filename=${f##*/}    # strip leading pattern that matches */ (be greedy)
    subdirs+=($filename)
done
# how many directories are we choosing between? don't hardcode it
numdirs=${#subdirs[@]}

#calculate the index into the array
# how many days since 1/1/70
days=$((`date --utc --date "$1" +%s`/86400))

ref=$(expr ${days} % ${numdirs})

todaydir=$PICDIR/${subdirs[${ref}]}

if [ -L ${my_link} ] ; then
   if [ -e ${my_link} ] ; then
      # here is where we do the needful. 
      if [ -d $todaydir ]; then
         rm $my_link
         ln -s $todaydir $my_link 
      else 
         echo "$todaydir doesn't exist"
      fi 
   else
      echo "No link $my_link"
   fi
elif [ -e ${my_link} ] ; then
   echo "${my_link} is not a link"
else
   echo "${my_link} is missing"
fi



