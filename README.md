# Nodejs "Hello world"
Based on [Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)
For others version of the Node.js container used here, got to [Docker Hub](https://hub.docker.com/r/wicastr/node/)

## Prepare your app
There must be a `package.json` file containing the start command.
Your app needs to be able to start with the port set in an environment variable.
```
const express = require('express');
const PORT = process.env.NODE_PORT || 3000;
app.listen(PORT, HOST);
```

### Start the container for development
docker run --name hello-node -v $(pwd):/usr/src/app -d wicastr/node:latest-onbuild
```
$ docker ps
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS                    NAMES
5df7d2377e5c        wicastr/node:latest-onbuild   "npm start"        1 minute ago         Up 1 minute          0.0.0.0:8080->80/tcp   hello-node
```
Go to [localhost:8080](http://localhost:8080) on your browser

## Build
Once your app is ready
Stop the development container and build
`docker stop hello-node`
`docker build -t <your username>/hello-node .`
```
$ docker images
REPOSITORY                      TAG        ID              CREATED
<your username>/hello-node    latest     d64d3505b0d2    1 minute ago
```

## Test
`docker run -p 8080:3000 -d <your username>/hello-node`

```
$ docker ps
ID            IMAGE                                COMMAND    ...   PORTS
ecce33b30ebf  <your username>/hello-node  npm start ...   8080->3000
```
Go to [localhost:8080](http://localhost:8080) on your browser

## Publish
### Tag the image for WICASTR's registry
`docker tag hub.wicastr.net/<your username>/hello-node`
### Push the image to the registry
`docker push hub.wicastr.net/<your username>/hello-node`
