#!/bin/bash
#
# run this on a folder with source files you're trying to check for/
# i.e. you find phpmyadmin running somewhere and you want to see if
# it matches a specific version. Download the source filese for that version
# extract the files, and then run ./dirb-dict-generator.sh on the 
# folder. 


echo "[?] output filename:"
read NAME

ls -R "$1" | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }' > ${NAME}
sed -i "s/$1//" ${NAME}
sed -i "s:^/::" ${NAME}
sed -i "s:\..*$::" ${NAME}
