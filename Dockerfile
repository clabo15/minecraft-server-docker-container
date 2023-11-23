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

# Accept the Minecraft server download link as an argument
ARG SERVER_JAR_URL

# Download the Minecraft server jar file
# Using wget with more robust error handling and retries
RUN wget --tries=5 --timeout=20 --retry-connrefused --waitretry=1 \
    -O server.jar "${SERVER_JAR_URL}" || \
    (echo "Failed to download server.jar" && exit 1)

# Verify the server.jar file is not empty
RUN if [ ! -s server.jar ]; then echo "server.jar is empty" && exit 1; fi

# Accept Minecraft's EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Define the command to start the Minecraft server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
