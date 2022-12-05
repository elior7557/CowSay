#!/bin/bash

PORT=8080
if [ $# -eq 1 ]; then
  PORT=$1 
fi

export PORT=$PORT
# npm start --prefix ./src
npm start
