#!/bin/bash

docker build . -t cowsay:v2
docker run -dit --name cowsay_mission -p 4001:3001 -e PORT=3001 cowsay:v2
