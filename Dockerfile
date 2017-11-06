#Step 1 - restore packages
FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /src

# caches restore result by copying csproj file separately
COPY ./docker-workshop.csproj /src/docker-workshop.csproj
RUN dotnet restore /src/docker-workshop.csproj

COPY . .
#publish
RUN dotnet publish /src/docker-workshop.csproj --output /app/ --configuration Release

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "docker-workshop.dll"]
