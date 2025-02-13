#!/bin/sh

cd $(dirname $0)

CONFIG_LINE="export PATH=\"$(pwd | sed -e "s%${HOME}%~%"):\${PATH}\""

if [ -d ~/.bashrc.d ];then
  echo $CONFIG_LINE > ~/.bashrc.d/util-bin
else
if [ $(grep "$CONFIG_LINE" ~/.bashrc | wc -l) -lt 1 ];then
  echo $CONFIG_LINE >> ~/.bashrc
fi
fi

