# docker-node-buildenv

The goal is to have separate docker images to install npm dependencies and run nodejs applications that are minimal in size. The installer image is currently 180M but the runtime image can be as little as 27M.

## Install

[ajnasz/node-npm-installer](https://registry.hub.docker.com/u/ajnasz/node-npm-installer/) adds build tools like make and npm and runs `npm install`, so that you only have to add your project root as a volume, mapped to /app like this:

```
docker run --rm -v $(PWD):/app ajnasz/node-npm-installer:1.0
```

You will find all the installed dependencies in the `node_modules` folder.

## Build

After a successful install, [ajnasz/node-runtime](https://registry.hub.docker.com/u/ajnasz/node-runtime/) can be used to build and run a nodejs application container, by adding no more but a FROM instruction into the applications Dockerfile:

```
FROM ajnasz/node-runtime:1.0
```

Building it:
```
docker build -t $(REPO):$(TAG) .
```

## Run

The container port 3000 is exposed, so an arbitrary host port can be forwarded to it.

Running it:
```
docker run --rm -p $(PORT):3000 $(REPO):$(TAG)
```

Run tests:
```
docker run --rm $(REPO):$(TAG) npm test
```
