#!/bin/bash
echo "starting container with db .."
docker start docker-workshop-mssql 

echo "update db "
export ConnectionStrings__Container="Server=10.0.75.2; Database=docker-workshop; User Id=sa;Password=vDbi2DiPmRFghIoC8B;"
dotnet ef database update 

echo "run image "
./run-docker-image.sh
