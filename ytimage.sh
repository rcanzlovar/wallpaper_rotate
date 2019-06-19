#!/bin/sh
# Given a youtube identifier, download the highest available thumbnail
# possible URLS to parse:
# https://www.youtube.com/watch?v=JEX_7vhpJbs
# https://youtu.be/JEX_7vhpJbs

# https://i.ytimg.com/vi/xSO1tW2niZo/maxresdefault.jpg


# make the directory if it doesn't exist
YTPICDIR=~/Pictures/YTimages
if [ ! -d "$YTPICDIR" ]; then
  echo "create $YTPICDIR"
  mkdir  ${YTPICDIR}
fi

# YTNUM is the v=xxx serial number that YouTube uses
YTNUM=

# find the identifier, whatever the URL given
for REGEX in  \
	"^https?://.*\.youtube.com/.*v=(.*)" \
	"^https://youtu.be/(.+)$" \
	"^([0-9a-zA-Z_\-]+)$" 
do
    if [[ "${1}" =~ $REGEX ]]
    then
        YTNUM=${BASH_REMATCH[1]}
    fi
done

if [ "${YTNUM}" != "" ]; then
  OUTPIC=YT_${YTNUM}.jpg

  # maxresdefault 1280x720, ~150K 
  # hqdefault 480x360, ~13k - 40k 
  # try the big one first, next the smaller one
  PICURL1=https://i.ytimg.com/vi/${YTNUM}/maxresdefault.jpg
  COMMAND1="wget ${PICURL1} --output-document=${YTPICDIR}/${OUTPIC}"

  PICURL2=https://i.ytimg.com/vi/${YTNUM}/hqdefault.jpg
  COMMAND2="wget ${PICURL2} --output-document=${YTPICDIR}/${OUTPIC}"

  echo ${COMMAND1}
  ${COMMAND1}

  # 8 status returns if we get a 404 error
  if [ "$?" = "8" ]; then
    echo ${COMMAND2}
    ${COMMAND2}
  fi
fi


