#Step 1 - restore packages
FROM microsoft/aspnetcore-build:2.0 AS builder
WORKDIR /src
COPY . .
RUN dotnet restore 
#publish
RUN dotnet publish --output /app/ --configuration Release

FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["dotnet", "docker-workshop.dll"]
