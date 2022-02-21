#!/usr/bin/bash

path=$1
extension=$2
dir=$3

cd $path
if [ -e $path/$dir ]
then
  rm -rf $dir $dir.tar.gz
fi
mkdir $dir
