#!/bin/bash

if [ "$(docker ps -a -q -f name=docker-workshop-mssql)" ]; then
    echo "Removing old database container..."
    docker rm -f docker-workshop-mssql >> /dev/null
    echo "Done."
fi

echo "Running new database container..."
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=vDbi2DiPmRFghIoC8B' --name=docker-workshop-mssql --network=host  -d microsoft/mssql-server-linux:2017-latest >> /dev/null
echo "Done."
