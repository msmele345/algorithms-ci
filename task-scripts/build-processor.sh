#!/bin/bash

cd algorithm-cloud-processor-git/

./gradlew clean test
#cp -r algorithm-api-git/application/build/libs/* algorithm-api-jar/
cp -r algorithm-cloud-processor-git/application/build/libs/* ../build/algorithm-api-jar/

#popd
