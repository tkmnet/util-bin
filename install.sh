#!/bin/sh

cd $(dirname $0)

CONFIG_LINE="export PATH=\"$(pwd | sed -e "s%${HOME}%~%"):\${PATH}\""

if [ $(grep "$CONFIG_LINE" ~/.bashrc | wc -l) -lt 1 ];then
  echo $CONFIG_LINE >> ~/.bashrc
fi

