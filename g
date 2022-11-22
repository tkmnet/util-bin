#!/bin/sh

if [ $# = 0 ];then
  git pull
else
  if [ "$1" = "a" ];then
    if [ $# = 1 ];then
      git add .
    else
      shift
      git add $*
    fi
  elif [ "$1" = "c" ];then
    if [ $# = 1 ];then
      echo "WRITE MESSAGE" 
    else
      shift
      git commit -m "$*"
    fi
  elif [ "$1" = "p" ];then
    git push
  fi
fi
echo "########"
git status
