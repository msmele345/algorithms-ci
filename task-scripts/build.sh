#!/bin/bash

set -e
pushd algorithm-api-git/

./gradlew clean test
#cp -r algorithm-api-git/application/build/libs/* algorithm-api-jar/
#cp -r algorithm-api-git/application/build/libs/* ../build/algorithm-api-jar/

popd
