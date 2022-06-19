#!/bin/bash

cat folders.txt | xargs -L 1 mkdir -p 
#mkdir -p main_dir
#mkdir -p main_dir/dir1
#mkdir -p main_dir/dir2
#mkdir -p main_dir/dir1/dir1_1
#mkdir -p main_dir/dir1/dir1_2
#mkdir -p main_dir/dir2/dir2_1
#mkdir -p main_dir/dir2/dir2_2

cat files.txt | xargs -L 1 touch
#touch main_dir/project_resource[0]_dev.yaml
#touch main_dir/dir1/project_resource[1]_dev.yaml
#touch main_dir/dir1/project_resource[2]_dev.yaml
#touch main_dir/dir1/dir1_1/project_resource[3]_dev.yaml
#touch main_dir/dir1/dir1_1/project_resource[4]_dev.yaml
#touch main_dir/dir1/dir1_2/project_resource[5]_dev.yaml
#touch main_dir/dir1/dir1_2/project_resource[6]_dev.yaml
#touch main_dir/dir2/project_resource[7]_dev.yaml
#touch main_dir/dir2/project_resource[8]_dev.yaml
#touch main_dir/dir2/dir2_2/project_resource[9]_dev.yaml
#touch main_dir/dir2/dir2_2/project_resource[10]_dev.yaml

echo -e "Folder and Files created:"
find ./main_dir | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"
