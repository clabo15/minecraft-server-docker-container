# Minecraft Server Docker Container
### Wiki Guide for Setting Up a Minecraft Server with Docker

#### Introduction

This comprehensive guide is designed to help you set up, run, and manage a Minecraft server using Docker and Docker Compose. Docker provides an isolated environment, making server deployment consistent and straightforward. This guide assumes basic familiarity with Docker, Docker Compose, and command-line interfaces.

---

#### Prerequisites

- Docker and Docker Compose installed on your machine. Refer to [Docker's official documentation](https://docs.docker.com/get-docker/) for installation instructions.
- Git for cloning the repository (optional but recommended).
- Basic familiarity with command-line operations.

---

#### Repository Setup

1. **Clone the Repository**: If the Docker setup is hosted on a Git repository, clone it to your local machine. If not, ensure you have the `Dockerfile` and `docker-compose.yml` locally.

   ```bash
   git clone [Your_Repository_URL]
   cd [Your_Repository_Directory]
   ```

---

#### Dockerfile Explanation

The `Dockerfile` contains instructions to build the Minecraft server Docker image. Key components:

- **Base Image**: Uses `debian:latest` for a stable Linux environment.
- **Dependencies**: Installs Java Development Kit and `wget` for downloading the server jar.
- **Working Directory**: Sets `/minecraft` as the server directory inside the container.
- **Server Jar**: Downloads `server.jar` from a specified URL and verifies its presence.
- **EULA Agreement**: Automatically agrees to Minecraft's EULA required to run the server.
- **Expose Port**: Exposes port `25565` for Minecraft server access.
- **Start Command**: Specifies the command to start the server.

---

#### Docker Compose Configuration

`docker-compose.yml` simplifies the process of building and running the Docker container.

- **Version**: Specifies the Compose file version.
- **Services**: Defines the Minecraft server service.
- **Build Context**: Points to the location of the Dockerfile and passes the server jar URL as an argument.
- **Port Mapping**: Maps the container's port `25565` to the host's port `25565`.
- **Volumes**: Sets up a volume for persistent data storage, mapping the host's `./data` directory to `/minecraft` in the container.
- **Restart Policy**: Ensures the server restarts automatically unless stopped manually.

---

#### Building and Running the Server

1. **Build the Image**: Build the Docker image with the following command:

   ```bash
   docker-compose build
   ```

   This command reads the `docker-compose.yml` file and builds the image as per the Dockerfile instructions.

2. **Start the Server**: To start the Minecraft server in detached mode (running in the background), use:

   ```bash
   docker-compose up -d
   ```

   This command starts the server and allows it to run independently of your terminal session.

3. **Server Logs**: To view real-time logs of the Minecraft server, run:

   ```bash
   docker-compose logs -f
   ```

   The `-f` flag keeps the log output open for real-time updates.

---

#### Connecting to the Server

1. **Local Connection**: On the host machine, open Minecraft, go to "Multiplayer", and add a new server with `localhost:25565` as the address.
2. **Network Connection**: From other devices on the same network, use the host machine's local IP address with port `25565`.

---

#### Managing the Server

- **Stopping the Server**: Run `docker-compose down` to gracefully stop the server.
- **Server Configuration**: Edit server properties and configurations directly in the `./data` directory on the host machine. Changes will reflect inside the container.
- **Updating the Server**: To update the server, change the `SERVER_JAR_URL` in `docker-compose.yml`, then rebuild and restart the container.

---

#### Troubleshooting Common Issues

- **Firewall and Port Forwarding**: Ensure the host machine's firewall allows traffic on port `25565`. For remote access, set up port forwarding on your router.
- **Version Mismatches**: Ensure the Minecraft client version matches the server version.
- **Container Health**: Use `docker ps` to check the container status. If stopped, inspect logs for potential issues.

---

#### Conclusion

This setup offers a reliable and efficient way to host a Minecraft server, leveraging Docker's advantages for easy deployment and management. The configuration can be further customized to suit specific needs or server types.
