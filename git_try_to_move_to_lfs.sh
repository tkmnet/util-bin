#!/bin/sh

is_live_file=no
export FILTER_BRANCH_SQUELCH_WARNING=1
if [ "$1" != "" ];then
  if [ -e "$1" ];then
    is_live_file=yes
  fi
  $(dirname $0)/git_rm_file_from_history.sh $*
else
  $(dirname $0)/git_find_big.sh
fi

if [ $is_live_file = "yes" ];then
  git lfs track "$1"
  git add .gitattributes
  git add "$1"
  git commit -m "Move $1 to LFS"
fi
