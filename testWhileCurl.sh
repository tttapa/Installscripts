#!/bin/bash

version=$((72))
result=0
while [ "$result" == "0" ] 
do
    
    curl -s -I -X GET http://download.blender.org/release/Blender2.${version} | head -n 1 | grep "HTTP/1.[01] [23].."
    result=$?
    echo -e "2.$version\t$result$"
    version=$((version+1))
done
version=$((version-2))
letters=("" "a" "b" "c")
echo ${letters[0]}
result=0
index=0
while [ "$result" == "0" ] 
do
    curl -s -I -X GET http://download.blender.org/release/Blender2.${version}/blender-2.${version}${letters[index]}-linux-glibc211-x86_64.tar.bz2 | head -n 1 | grep "HTTP/1.[01] 2.."
    result=$?
    echo -e "2.$version${letters[index]}\t$result"
    index=$((index+1))
done
index=$((index-2))
echo http://download.blender.org/release/Blender2.${version}/blender-2.${version}${letters[index]}-linux-glibc211-x86_64.tar.bz2
