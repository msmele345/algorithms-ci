#!/bin/bash

#cd algorithm-api-git/ || exit
pushd algorithm-api-git/

mkdir ../jars/artifact

#./gradlew clean test
./gradlew build
cp /tmp/build/80754af9/algorithm-api-git/build/libs/*.jar ../jars/artifact/algorithm-api.jar

echo JAR FILE
ls ../jars/artifact
#cp target/*.jar ../build/algorithm-api.jar
#cp -r algorithm-api-git/application/build/libs/* ../build/algorithm-api-jar/

popd || exit
