<div align="center"> English | <a href="./README.md">简体中文</a> </div>

# docker

docker configuration repository

## One-click deployment (beta)

```sh
curl -fsSL https://raw.githubusercontent.com/TranscodeGroup/docker/master/download-and-install.sh | sudo bash
```

## Deployment

### 1. Initialization

```sh
mkdir -p /home/docker-compose
mkdir /data
git clone https://github.com/TranscodeGroup/docker.git /home/docker
```

### 2. Configure `compose.yaml`

Create `/home/docker-compose/compose.yaml` file, refer to the following example:

**Single machine separate deployment**:

- [bus-http](./examples/bus-http/compose.yaml): Bus http single machine deployment
- [bus-https](./examples/bus-https/compose.yaml): Bus https single machine deployment
- [track-http](./examples/track-http/compose.yaml): Tracker V2 http single machine deployment
- [track-https](./examples/track-https/compose.yaml): Tracker V2 https single machine deployment

**Distributed deployment**:

- [video-storage](./examples/video-storage/compose.yaml): RTP storage
- [video-stream](./examples/video-stream/compose.yaml): RTP video

### 3. Configure `.env`

Create `/home/docker-compose/.env` file, refer to [default.en.env](./default.en.env) to override the configuration items that need to be changed.

Execute the following command in `/home/docker-compose` to verify whether all required values used have been set:

```sh
docker compose config
```

After passing the verification, execute the following command to export the compose configuration to a file, so as to compare the differences after updating the compose file:

```sh
docker compose config > compose-stack.yaml
```

### 4. Configure Frontend

Frontend override directory, used to place project-specific frontend configuration files such as `_app.config.js`:

- `/home/docker-compose/bus-override`: bus frontend override directory
- `/home/docker-compose/track-override`: track frontend override directory

**Note**: After modifying the configuration, you need to execute `docker compose up` for the file to be overwritten to `/data/nginx/html/`. Because it uses the overwrite method, it is not recommended to directly modify the files in `/data/nginx/html/`.

### 5. Other optional configurations

- [jtt808 video conversion tool](./jtt808/README.md)
- [Manually download frontend](./scripts/README.md)

### 6. Start

Execute the following command in `/home/docker-compose` to start docker:

```sh
docker compose up
```

### 7. Manage docker-compose directory with git

Execute the following commands in `/home/docker-compose`

```sh
# Switch to the directory
cd /home/docker-compose 

# After modifying the configuration each time, remember to back up the configuration to compare the actual impact difference
docker compose config > compose-stack.yaml

# Configure GIT account
git config --global user.name "tg"
git config --global user.email tg@gmail.com

# Initialize GIT
git init
# Add to staging area
git add -A
# Commit local warehouse
git commit -m "Initial commit"
```
