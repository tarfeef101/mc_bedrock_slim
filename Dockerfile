FROM debian:10.3-slim

WORKDIR /opt/

ENV LD_LIBRARY_PATH=. EULA=TRUE

# download+unpack & move configs to 1 folder
# this allows for less volumes
# ty @Roemer for the idea
RUN apt update && \
    apt -y upgrade && \
    apt install -y curl unzip && \
    curl -sSL https://minecraft.azureedge.net/bin-linux/bedrock-server-1.14.60.5.zip -o minecraft.zip && \
    unzip minecraft.zip && \
    apt -y remove unzip && \
    apt -y autoremove --purge && \
    apt -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm minecraft.zip && \
    mkdir config && \
    mv server.properties config && \
    mv permissions.json config && \
    mv whitelist.json config && \
    ln -s config/server.properties server.properties && \
    ln -s config/permissions.json permissions.json && \
    ln -s config/whitelist.json whitelist.json

CMD ./bedrock_server
