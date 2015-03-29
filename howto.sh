#!/bin/sh

docker run -ti --rm -v $PWD:/app ajnasz/nodejs-npm-installer

docker build -t sajl-app .
