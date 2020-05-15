#!/bin/sh

_file='Dockerfile'
_ver=`curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE`
_file_ver=`grep 'https://chromedriver.storage.googleapis.com' $_file | awk 'BEGIN {FS="/"}; {print $4}'`


if [ $_ver != $_file_ver ];then 
  sed -i "s/$_file_ver/$_ver/g" $_file
  echo "new_ver: $_ver"

else 
  echo "Nothing_be_change: $_ver"  
fi 


