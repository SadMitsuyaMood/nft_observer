#!/bin/bash

echo "*** root packages ***"
cd ..
for folder in core core_ui navigation
do
    echo "*** $folder ***"
    cd "$folder"
    dart pub upgrade && dart pub cache repair && cd ..
done

echo "*** features ***"
cd features
for folder in splash
do
    echo "*** $folder ***"
    cd "$folder"
    dart pub upgrade && dart pub cache repair && cd ..
done
cd ..

echo "*** root ***"
dart pub upgrade && dart pub cache repair