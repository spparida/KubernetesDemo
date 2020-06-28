FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore

# Copy everything else and build
COPY . .
RUN dotnet publish -c Release -o /app

# Build runtime image
ENTRYPOINT ["dotnet", "HelloWebApp.dll"]

ENV ASPNETCORE_URLS=http://+:80  
EXPOSE 80
