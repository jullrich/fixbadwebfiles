#!/usr/bin/env bash

# set this variable to your document root
root=/srv/www/html/

# this is a text file with "good" extensions you want to keep
goodextfile=/etc/httpd/goodext.txt

# set this to 'Y' to actually delete files
debug='Y'

####
#  no configuration options beyond this point.
####

if [[ $debug == 'N' ]]; then
  echo "not running in debug mode. I will delete files"
else
  echo "running in debug mode. I will NOT delete files"
fi

readext () {
  local i=0
  local e
  for e in `cat $goodextfile`; do
    goodext[i]=$e
    i=$((i+1))
  done
  i=$((i-1))
}

cleandir () {
    local f
    local e
    local ext
    local good
    local OLDIFS=$IFS
    IFS=$'\n'
    for f in `find $root -type f -name '*\.*'`; do
	ext=`echo $f | sed 's/.*\.//'`
	good=0
	for e in "${goodext[@]}"; do
	    if [[ "$ext" == "$e" ]]; then
		good=1
	    fi
        done
	if [[ $good -eq 0 ]]; then
	    echo delete $f
	    if [[ $debug == 'N' ]]; then
		rm $f
	    fi
	fi
    done
    IFS=$OLDIFS
}

readext
cleandir
