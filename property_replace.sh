#!/bin/bash

###############################################################
##
## [USAGE]
##   kv-replase.sh <keyName> <value>
## [EXAMPLE]
##   kv-replase.sh nablarchRepoReferenceUrl http://hoge.com
##
###############################################################

WORK_DIR=./work

if [ ! -d $WORK_DIR ]; then
  echo 'error!' 
  return 1
fi

cd $WORK_DIR

find . -maxdepth 3 -name *.properties -type f | while read f
  do
    if grep -sqE "$1\s*=" $f; then
    
      sed -i -e "s|$1\s*=.*$|$1=$2|" $f
      
      pushd `dirname $f` > /dev/null
      echo `pwd`
      git diff
      popd > /dev/null

    fi
  done


