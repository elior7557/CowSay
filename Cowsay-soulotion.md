Excercise: Creating a Dockerfile for "Cowsay"
=============================================
Cowsay is a program that generates ASCII pictures of a cow with a message.
Cowsay sources are found in the "cowsay" sub directory.

Your mission:
1. See some Dupak Chopra quotes in your browser:
   a. Read the cowsay readme
   b. Use bash in the standard "node" docker container to execute the server
   c. View in browser


## Inside /src RUN:
```
npm install
npm start

optinal:
export PORT=8080
```

2. Create an immutable cowsay server:
   a. Write entry-point.sh that:
      - accepts the port as an argument
      - maintains 8080 as default, when no argument passed
      - executes the server
   b. Create a docker file that:
      - uses node as the base image
      - installs all needed dependencies as required for execution
      - uses entry-point.sh to execute
   c. build the image
   d. execute on port 3001 INTERNALY and 4001 EXTERNALLY
   e. View in browser

# Entry Point (a)
```
#!/bin/bash

PORT=8080
if [ $# -eq 1 ]; then
  PORT=$1 
fi

export PORT=$PORT
npm start --prefix /home/superman/Desktop/bootcamp/day6-buildTools-npm/cowsay/src
```
# docker file (b)
```
FROM node
LABEL cowsay.version=v1.1
ENV PORT=8080
RUN mkdir -p /var/node
COPY src/ /var/node/
WORKDIR /var/node
RUN npm install
COPY entry-point.sh /var/node
ENTRYPOINT /var/node/entry-point.sh $PORT
```
  ### +.dockerignore file
  

1. Use node-alpine as your base image