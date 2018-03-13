# Nodejs "Hello world"
Based on [Dockerizing a Node.js web app](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)


## Build
`docker build -t <your username>/node-hello-world .`
```
$ docker images
REPOSITORY                      TAG        ID              CREATED
<your username>/node-hello-world    latest     d64d3505b0d2    1 minute ago
```

## Run
`docker run -p 8080:3000 -d <your username>/node-hello-world`

```
$ docker ps
ID            IMAGE                                COMMAND    ...   PORTS
ecce33b30ebf  <your username>/node-hello-world:latest  npm start  ...   8080->3000
```

## Access
Go to [localhost:8080](http://localhost:8080) on your browser
