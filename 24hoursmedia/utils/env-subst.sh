#!/bin/sh

# replace any environment variables in file, specified by ${VARNAME}..
# arg1 = input file
# arg2 = output file
#
# substitution is buffered, so you can specify same in and out file.
# requires gettext (apk add gettext)

set -e

INFILE=$1
OUTFILE=$2

if [ -z "$INFILE" ]
then
  echo "specify an input file"
  exit 1
fi
if [ -f "$INFILE" ]
then
  echo ""
else
  echo "input file $INFILE does not exist"
  exit 1
fi

if [ -z "$OUTFILE" ]
then
  echo "specify an output file"
  exit 1
fi

echo "Replacing env variables in file $1 to file $2"

VARNAMES=`printf '${%s} ' $(sh -c "env|cut -d'=' -f1")`
BUFFER=`echo | envsubst "$VARNAMES" < $INFILE`

echo "$BUFFER" > $OUTFILE

echo "done"