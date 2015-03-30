#!/bin/sh

docker run -ti --rm -v $PWD:/app ajnasz/node-npm-installer

docker build -t your-image-name .
