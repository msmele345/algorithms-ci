#!/usr/bin/env bash

fly -t algos login -n algorithms
fly -t algos set-pipeline -p algorithms -c ../../pipelines/algorithm-pipeline.yml -l credentials.yml
fly -t algos unpause-pipeline -p algorithms
