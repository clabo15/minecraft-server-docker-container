# Start from a Debian base image
FROM debian:latest

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y \
    default-jdk \
    wget \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Specify a directory for the Minecraft server
WORKDIR /minecraft

# Expose the Minecraft server port
EXPOSE 25565

# Define the command to start the Minecraft server
CMD echo "eula=true" > /minecraft/eula.txt && \
    java -Xmx1024M -Xms1024M -jar /minecraft/server.jar nogui
