# docker

docker configuration file repository

## Deployment

### 1. Initialization

```sh
mkdir -p /home/docker-compose
mkdir /data
git clone https://github.com/TranscodeGroup/docker.git /home/docker
```

### 2. Configure `compose.yaml`

Create `/home/docker-compose/compose.yaml` file, refer to the following examples:

**Single machine standalone deployment**:

- [bus-http](./examples/bus-http/compose.yaml): Bus http standalone deployment
- [bus-https](./examples/bus-https/compose.yaml): Bus https standalone deployment
- [track-http](./examples/track-http/compose.yaml): Tracker V2 http standalone deployment
- [track-https](./examples/track-https/compose.yaml): Tracker V2 https standalone deployment

**Distributed deployment**:

- [video-storage](./examples/video-storage/compose.yaml): RTP storage
- [video-stream](./examples/video-stream/compose.yaml): RTP video

### 3. Configure `.env`

Create `/home/docker-compose/.env` file, refer to [.env.default](./.env.default) to override configuration items that need to be changed.

Execute the following command in `/home/docker-compose` to verify if all required values used are set:

```sh
docker compose config
```

After verification passes, execute the following command to export the compose configuration to a file, which is convenient for comparing differences after updating the compose file:

```sh
docker compose config > compose-stack.yaml
```

### 4. Configure Frontend

Frontend override directory, used to place project-specific frontend configuration files like `_app.config.js`:

- `/home/docker-compose/bus-override`: bus frontend override directory
- `/home/docker-compose/track-override`: track frontend override directory

**Note**: After modifying the configuration, you need to execute `docker compose up` for the files to be overwritten to `/data/nginx/html/`. Because it uses the overwrite method, it is not recommended to directly modify files inside `/data/nginx/html/`.

### 5. Other Optional Configurations

- [jtt808 video conversion tool](./jtt808/README.md)
- [Manually download frontend](./scripts/README.md)

### 6. Start

Execute the following command in `/home/docker-compose` to start docker:

```sh
docker compose up
```

### 7. Manage docker-compose directory using git

Execute the following commands in `/home/docker-compose`

```sh
# Switch to the directory
cd /home/docker-compose 

# After modifying configuration each time, remember to backup the configuration for convenient comparison of actual impact differences
docker compose config > compose-stack.yaml

# Configure GIT account
git config --global user.name "tg"
git config --global user.email tg@gmail.com

# Initialize GIT
git init
# Add to staging area
git add -A
# Commit to local repository
git commit -m "Initial commit"
```

## Precautions

### Version Management, remember to sync scripts under mysql when iterating versions

```sh
# bus frontend
BUS_WEB_VERSION=xxx
# bus backend
BUS_GATEWAY_VERSION=xxx
#...
```