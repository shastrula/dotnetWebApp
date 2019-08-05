#!/bin/sh

cd /app
dotnet new webApp -o myWebApp --no-https
cd /app/myWebApp

dotnet watch run --no-restore --urls http://0.0.0.0:5000
