#!/bin/bash

docker run \
  -it \
  --rm \
  -v ./results:/results \
  twitch-recover:latest
