FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY ./app .
ENTRYPOINT ["dotnet", "docker-workshop.dll"]


