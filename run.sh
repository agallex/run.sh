#!/usr/bin/bash

path=$1
extension=$2
dir=$3

recurse() {
  x=$(ls)
  for file in $x
  do
    if [ $file != $dir ]
    then
      if [ -d $file ]
      then
        cd $file
        recurse
        cd ..
      else
        if [[ $file == *.$extension ]]
        then
          cp $file $path/$dir
        fi
      fi
    fi
  done
}

cd $path
if [ -e $path/$dir ]
then
  rm -rf $dir $dir.tar.gz

mkdir $dir

recurse

tar -cf $4 $dir

echo done
