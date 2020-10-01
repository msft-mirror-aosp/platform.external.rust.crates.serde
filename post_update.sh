#!/bin/bash

# $1 Path to the new version.
# $2 Path to the old version.

set -x
set -e

# work around missing std_atomic64 on arm/arm64
SRCFILE=Android.bp
OLDSTR='"--cfg std_atomic64",'
NEWSTR='// "--cfg std_atomic64", // not for arm/arm64'
sed -i -e "s:$OLDSTR:$NEWSTR:" $SRCFILE
# Make sure that sed replaced $OLDSTR with $NEWSTR
grep "$NEWSTR" $SRCFILE > /dev/null
