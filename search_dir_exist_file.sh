#!/bin/bash

WORK_DIR=./work

if [ ! -d $WORK_DIR ]; then
  echo 'error!' 
  return 1
fi

cd $WORK_DIR

for dir in `find ./* -mindepth 1 -maxdepth 1 -type d`; do

  ##grep "$dir" ../exclude.lst > /dev/null
  ##if [ $? -eq 0 ]; then
  ##  continue;
  ##fi

  pushd $dir > /dev/null

  if [ -f dummy.txt ]; then
    echo $dir
  fi

  popd > /dev/null
done


