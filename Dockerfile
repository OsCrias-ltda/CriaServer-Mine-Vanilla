
FROM --platform=linux/arm64 arm64v8/openjdk:latest
WORKDIR /server
COPY --chown=ubuntu:ubuntu server/ .
ENTRYPOINT java -Xms4G -Xmx8G -jar ./paper.jar --nogui

# Squaremap default port
EXPOSE 8080
# Default server port
EXPOSE 25565
