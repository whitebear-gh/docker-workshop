#!/bin/bash
echo "clean old containers..."
docker rm -f docker-ws

#echo "Publishing dotnet app..."
#dotnet restore && dotnet build && dotnet publish --output app/


echo "building new image..."
docker build -t docker/workshop .

echo "running image on port 5008.."

#!!
#docker run -p 5008:80 --name docker-ws -it docker/workshop

export ConnectionStrings__Container="Server=localhost; Database=docker-workshop; User Id=sa;Password=vDbi2DiPmRFghIoC8B;"
docker run --network=host --name docker-ws -e ASPNETCORE_ENVIRONMENT=Development -e ASPNETCORE_URLS="http://*:5008" -it docker/workshop
#docker run --network=host --name docker-ws -d docker/workshop

