#!/usr/bin/env bash

for release in 'jessie' 'stretch' 'buster' 'latest'
do
    sed s/%%VERSION%%/$release/ Dockerfile.template > .debian-$release
    docker build -t debian-cse:$release -f .debian-$release .
done
