#!/bin/sh
BASEDIR="/data/work/autoruns"
echo "Running $BASEDIR" | logger -t "autoruns"
cd "$BASEDIR"
for f in `ls $BASEDIR`; do
  echo "Running $f" | logger -t "autoruns"
  ./$f | logger -t "autoruns"
done
