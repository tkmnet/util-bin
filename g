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
  elif [ "$1" = "acp" ];then
    if [ $# = 1 ];then
      echo "WRITE MESSAGE" 
    else
      shift
      git add .
      git commit -m "$*"
      git push
    fi
  elif [ "$1" = "p" ];then
    git push
  elif [ "$1" = "B" ];then
    if [ $# = 2 ];then
      git branch $2
      git switch $2
      git push -u origin $2
    else
      echo "SET NAME" 
    fi
  elif [ "$1" = "b" ];then
    if [ $# = 2 ];then
      git switch $2
    else
      git branch
    fi
  fi
fi
echo "######## " $(git describe --tags) " #"
git status
