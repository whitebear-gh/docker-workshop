#!/bin/bash
echo "clean old containers..."
docker rm -f docker-ws

echo "Publishing dotnet app..."
dotnet restore && dotnet build && dotnet publish --output app/


echo "building new image..."
docker build -t docker/workshop .

echo "running image on port 5008.."
docker run -p 5008:80 --name docker-ws -it docker/workshop

