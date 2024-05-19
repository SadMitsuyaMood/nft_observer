cd ..
for core
do
    echo "*** $folder ***"
    cd "$folder"
    dart pub upgrade && dart pub cache repair && cd ..
done

dart pub upgrade && dart pub cache repair