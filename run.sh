#!/usr/bin/bash

path=$1
extension=$2
dir=$3

recurse() {
  x=$(ls)
  local file
  for file in $x
  do
    if [ -d $file ]
    then
      cd $file
      recurse
      if [ `ls -a -1 | wc -l` -eq 2 ] #checking empty directory
      then
        cd ..
        rm -rf $file
      else
        cd ..
      fi
    else
      if [[ $file != *.$extension ]]
      then
        rm -rf $file
      fi
    fi
  done
}

cd $path
cd ..
if [ -e $dir ]
then
  rm -rf $dir $dir.tar.gz
fi

mkdir $dir

cp -r $path $dir

cd $dir

recurse

cd ..

tar -cf $4 $dir

echo done
