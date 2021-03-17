#!/bin/bash

docker build --network=host --tag kevin/algoschallenge:v0.1 .

docker run -p 8989:80 -it kevin/algoschallenge:v0.1

