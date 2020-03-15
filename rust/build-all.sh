#!/usr/bin/env bash

for release in 'jessie' 'stretch' 'buster' 'latest'
do
    for version in '1.42'
    do
        sed s/%%DEBIAN-SUITE%%/$release/ Dockerfile.template | \
		sed s/%%RUST-VERSION%%/$version.0/ > .rust-$version-$release
        docker build -t rust-cse:$version-$release -f .rust-$version-$release . || exit 1
    done
done
