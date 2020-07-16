FROM ubuntu:groovy

ARG USERNAME=vscode
# On Linux, replace with your actual UID, GID if not the default 1000
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && mkdir -p /home/$USERNAME/.vscode-server /home/$USERNAME/.vscode-server-insiders \
    && chown ${USER_UID}:${USER_GID} /home/$USERNAME/.vscode-server*

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# dependencies for building CPython 
RUN apt-get update && apt-get install -y git libffi-dev make build-essential openssl libssl-dev zlib1g-dev libsqlite3-dev && rm -rf /var/lib/apt/lists/*

# change the username
USER $USERNAME

