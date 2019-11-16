#!/bin/bash
if [ "$#" != "3" ]; then
    echo "Wrong size of arguments."
    exit
fi
rm -rf ./deb-src
mkdir -p deb-src
cd deb-src
mkdir -p ./$2/DEBIAN
mkdir -p ./$2/$1/share/covscript
cp -r ../build/bin ./$2/$1/
cp -r ../build/imports ./$2/$1/share/covscript
chmod -R 777 ./$2
SIZE=$(du -s ../build | grep -o -E "[0-9]+")
echo "Package: covscript-minimal">>./$2/DEBIAN/control
echo "Version: $3">>./$2/DEBIAN/control
echo "Section: utils">>./$2/DEBIAN/control
echo "Priority: optional">>./$2/DEBIAN/control
echo "Architecture: $2">>./$2/DEBIAN/control
echo "Installed-Size: $SIZE">>./$2/DEBIAN/control
echo "Maintainer: Michael Lee <mikecovlee@163.com>">>./$2/DEBIAN/control
echo "Description: Covariant Script Programming Language Minimal Edition">>./$2/DEBIAN/control
echo >>./$2/DEBIAN/control
chmod -R 755 ./$2/DEBIAN
dpkg-deb -b $2 covscript-minimal-$3-$2.deb
rm -rf $2
