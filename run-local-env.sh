#!/bin/bash
echo "starting container with db .."
docker start docker-workshop-mssql >> /dev/null

echo "restore, build "
dotnet restore && dotnet build 

echo "update db "
dotnet ef database update && dotnet run