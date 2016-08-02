#!/bin/bash

WORK_DIR=./work

if [ ! -d $WORK_DIR ]; then
  mkdir $WORK_DIR
fi

pushd $WORK_DIR

while read line; do

  if [ -n $line ]; then
    continue
  fi

  subdir=`echo "$line" | sed -E 's|https://.*/(.*)/.*\.git|\1|'`

  if [ ! -d $subdir ]; then
    mkdir $subdir
  fi

  pushd $subdir
  git clone --depth 1 $line
  git checkout develop
  popd

done < ../sample_data/repo_list.txt

popd 

