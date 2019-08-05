# STAGE01 - Build application and its dependencies
FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /app

RUN dotnet new webApp -o myWebApp --no-https
WORKDIR /app/myWebApp


ENTRYPOINT [ "dotnet", "watch", "run", "--no-restore", "--urls", "http://0.0.0.0:5000"]


EXPOSE 5000