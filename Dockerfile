# STAGE01 - Build application and its dependencies
FROM microsoft/dotnet:2.2-sdk AS build-env
WORKDIR /app
COPY myWebApp/*.csproj ./
COPY . ./
RUN dotnet restore 

# STAGE02 - Publish the application
FROM build-env AS publish
RUN dotnet publish -c Release -o /app

# STAGE03 - Create the final image
FROM microsoft/dotnet:2.2-aspnetcore-runtime
WORKDIR /app
COPY --from=publish /app .
# ENTRYPOINT ["dotnet", "myWebApp.dll", "--server.urls", "http://*:80"]
ENTRYPOINT ["dotnet", "myWebApp.dll"]

EXPOSE 5000