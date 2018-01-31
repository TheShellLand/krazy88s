#!/bin/bash

# Requires access to docker socket
docker rmi $(docker images -f "dangling=true" -q)
