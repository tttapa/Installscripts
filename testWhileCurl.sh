#!/bin/bash

version=71
a=0
normal=0
while [ "$a" == "0" ] || [ "$normal" == "0" ] 
do
    aprev=$a
    curl -s -I -X GET http://download.blender.org/release/Blender2.${version}/blender-2.${version}-linux-glibc211-x86_64.tar.bz2 | head -n 1 | grep "HTTP/1.[01] 2.."
    normal=$?
    curl -s -I -X GET http://download.blender.org/release/Blender2.${version}/blender-2.${version}a-linux-glibc211-x86_64.tar.bz2 | head -n 1 | grep "HTTP/1.[01] 2.."
    a=$?
    version=$((version+1)) 
done
version=$((version-2)) 
if [ "$aprev" == "0" ]
then
    echo "http://download.blender.org/release/Blender2.${version}/blender-2.${version}a-linux-glibc211-x86_64.tar.bz2"
else
    echo "http://download.blender.org/release/Blender2.${version}/blender-2.${version}-linux-glibc211-x86_64.tar.bz2"
fi