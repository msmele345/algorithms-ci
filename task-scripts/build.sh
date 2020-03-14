#!/bin/bash

cd algorithm-api-git/

mkdir ../jars/artifact
mkdir ../jars/stubs

#./gradlew clean test
./gradlew clean build
cp -r algorithm-api-git/application/build/libs/* ../jars/artifact
cp -r algorithm-api-git/application/build/libs/* ../jars/stubs
#cp -r algorithm-api-git/application/build/libs/* ../build/algorithm-api-jar/

#popd
