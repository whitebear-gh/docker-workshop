#!/bin/bash
docker login dockerworkshop.azurecr.io -u dockerworkshop -p XXX

docker tag docker/workshop dockerworkshop.azurecr.io/docker-workshop
docker push dockerworkshop.azurecr.io/docker-workshop

#docker pull dockerworkshop.azurecr.io/hello-world