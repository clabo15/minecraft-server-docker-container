# Minecraft Server Docker Container

## Introduction

This guide provides instructions for setting up a Minecraft server using Docker. This approach requires the Minecraft server jar file to be already present in a `data` folder.

## Prerequisites

- Docker and Docker Compose installed on your machine.
- The Minecraft server jar file (`server.jar`) downloaded in a `data` folder.

## Setup Instructions

1. **Prepare the Data Folder**:
   - Create a folder named `data` in the same directory as your Dockerfile and docker-compose.yml.
   - Download the `server.jar` file into this `data` folder.

2. **Build the Docker Image**:
   - Run `docker-compose build` to create the Docker image.

3. **Start the Minecraft Server**:
   - Execute `docker-compose up -d` to start the server in detached mode.

4. **Access the Server**:
   - Connect to the server using `localhost:25565` or the host machine's IP address with port `25565`.

5. **Server Management**:
   - The `data` folder on your host machine is mapped to `/minecraft` in the Docker container. You can place server configurations and world data here.
   - To stop the server, run `docker-compose down`.

## Updating the Server

To update the server, replace the `server.jar` in the `data` folder with the new version and restart the Docker container.

## Troubleshooting

- Ensure the port `25565` is open on your firewall and router for external connections.
- Check the `docker-compose logs` for any errors if the server is not running as expected.

## Conclusion

This Docker-based setup simplifies the deployment and management of a Minecraft server, ensuring consistency and ease of updates.
