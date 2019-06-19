#!/bin/bash
# images from https://xkcd.com/1335 
# maintain a symbolically linked image of a clock 
# This version of the script has 15 minute granularity, so you can update it 
 
PICDIR=/home/banzlova/Pictures/XKCD-worldclock
MASTERPICDIR=/local/rca/Pictures
OUTLINK=/local/rca/Pictures/infographics__/xkcdclock.png
OUTLINK=/local/rca/Pictures/aww__/xkcdclock.png
OUTFILENAME=xkcdclock.png


# get the hour part of GMT, add 36 and then mod 24 to offset the 
# gmt by 12 hours to match the diles from xkcd. He made 00h00m.png
# correspond to noon GMT

# parens are important because i want to do adddition before 
# modulus division
hour=$(( ($(date -u '+%H')+12)%24 ))

if [ "$hour" -lt 10 ] 
then
    hour="0$hour"
fi

minute=$(date -u '+%M')

if [ $minute -gt 44 ] 
then
    quarter=45
elif [ $minute -gt 29 ] 
then
    quarter=30
elif [ $minute -gt 14 ] 
then
    quarter=15
else 
    quarter=00
fi

PIC=${hour}h${quarter}m.png

# where is the source picture? 
INLINK=${PICDIR}/${PIC}
if [ -f $INLINK ] # make sure it exists
then
    # make a symlink into all the directories that might 
    # be used for screen savers. This way, the xkcdclock
    # is a member of all of the screensaver sets so it can
    # show any time, and is updated to the most recent 15 minutes
    # see my wallpaper_rotate.sh script for switching periodically
    # between several folders of pictures with different themes
    for DIRS in $(ls -d $MASTERPICDIR/*__)
    do
        OUTLINK=$DIRS/$OUTFILENAME
        ln -s $INLINK $OUTLINK
    done
fi
