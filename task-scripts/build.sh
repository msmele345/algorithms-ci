#!/bin/bash

#cd algorithm-api-git/ || exit
pushd algorithm-api-git/

mkdir ../jars/artifact
mkdir ../jars/stubs

#./gradlew clean test
./gradlew build
cp algorithm-api-git/build/libs/*.jar ../jars/artifact/algorithm-api-jar/
#cp -r algorithm-api-git/application/build/libs/* ../build/algorithm-api-jar/

popd || exit
