# STAGE01 - Build application and its dependencies
FROM microsoft/dotnet:2.2-sdk
WORKDIR /app

COPY entrypoint.sh /app

RUN chmod +x /app/*.sh

ENTRYPOINT [ "/app/entrypoint.sh"]

EXPOSE 5000