#!/bin/sh

exclude_list=/lsyncd-exclude/${EXCLUDE_HANDLE}.txt

if [ -n "$EXCLUDE_HANDLE" ]
then
  ls -l $exclude_list
  if [ -f "$exclude_list" ]
  then
	  echo "symlinking exclude list $exclude_list"
	  ln -sf $exclude_list /exclude.txt
  else
  	echo "exclude list $exclude_list does not exist. supported (without .txt):"
  	ls /lsyncd-exclude | sed 's/.txt//'
	  exit 1
  fi
fi

# parse environment variables in lsyncd.conf
export DELAY=${DELAY:-2}
export STATUS_INTERVAL=2
export RSYNC_ARCHIVE=true
export RSYNC_PERMS=true
sh /24hoursmedia/utils/env-subst.sh /lsyncd.conf.src /lsyncd.conf

echo "configuration:"
cat /lsyncd.conf


echo "starting lsyncd"
lsyncd /lsyncd.conf



