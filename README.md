# Dockerized Bedrock Server
This project is a simple dockerized environment in which to run a minecraft bedrock server. The main goals vs existing solutions are simple persistence (bind mounts to easily modify+backup world and config data), keeping a slim image (debian slim based, minimal layers), and easy iterability (change one URL to rebuild on a new version of bedrock server).

The Docker Hub page can be found at [this link](https://hub.docker.com/repository/docker/tarfeef101/mc_bedrock_debslim).

## Anatomy
```
.
config/
docker-compose.yaml
Dockerfile
permissions.json
server.properties
whitelist.json
worlds/
```
### config/
This directory is what will be bind-mounted into the container to house your config files. You should put your personalized `permissions.json`, `server.properties`, and `whitelist.json` files in this directory.

### docker-compose.yaml
This file is what defines the runtime state of your container. This is a very simple setup, so just ensure to forward the port over UDP, and select whatever port you wish to expose for your host port, and remember to keep this project in a folder mounted on a drive where you want those persisted directories to store data.

### Dockerfile
The Dockerfile tries to keep the image as simple and slim as possible. A slim base image is used to reduce size, minimal packages are installed, and all `RUN` commands are kept into one layer to reduce size.

### permissions.json, server.properties, and whitelist.json
These are the config files used to define the behaviour of your server. The .zip downloaded by the Dockerfile contains an HTML page with a guide as to how these work. Information can also be found online at resources such as [here](https://minecraft.gamepedia.com/Bedrock_Dedicated_Server#Configuration). 

### worlds/
This is the bind-mounted directory which will house your world data. This should be empty unless you have a pre-existing world you want to import. If you want to add add-ons and resource packs, this is the place to put them.
