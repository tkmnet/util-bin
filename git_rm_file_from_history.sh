#!/bin/sh

is_live_file=no
tmpdir="/tmp/git-rm.$$"
export FILTER_BRANCH_SQUELCH_WARNING=1
if [ "$1" != "" ];then
  if [ -e "$1" ];then
    is_live_file=yes
    rm -rf $tmpdir
    mkdir -p $tmpdir
    cp "$1" $tmpdir/
  fi
git filter-branch --index-filter "git rm --cached --ignore-unmatch $1" --tag-name-filter 'cat' -- --all
fi
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

if [ $is_live_file = "yes" ];then
  mv $tmpdir/* $(dirname "$1")/
  rm -rf $tmpdir
fi

git reflog expire --expire=now --all
git gc --aggressive --prune=now

git status

echo "Next: git push origin --all --force"
