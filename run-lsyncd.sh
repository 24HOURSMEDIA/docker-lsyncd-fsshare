#!/bin/sh

exclude_list=/lsyncd-exclude/${exclude_handle}.txt

if [ -n "$exclude_handle" ]
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

echo "starting lsyncd"
lsyncd /lsyncd.conf



