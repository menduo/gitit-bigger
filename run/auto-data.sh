#!/bin/bash
path_current_dir=$(cd `dirname $0`; pwd)
# echo $path_current_dir

path_gitit_dir=$(cd $path_current_dir;cd ..;pwd)
# echo $path_gitit_dir

cd $path_gitit_dir
cd wikidata
git pull -f origin master
git push -f origin master
