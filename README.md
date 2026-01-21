# docker

Docker configuration files repository

## Deployment

### 1. Initialization

```sh
mkdir -p /home/docker-compose
mkdir /data
git clone https://github.com/TranscodeGroup/docker.git /home/docker
```

### 2. Configure `compose.yaml`

Create `/home/docker-compose/compose.yaml` file, refer to the following examples:

**Standalone Deployment**:

- [bus-http](./examples/bus-http/compose.yaml): Bus HTTP standalone deployment
- [bus-https](./examples/bus-https/compose.yaml): Bus HTTPS standalone deployment
- [track-http](./examples/track-http/compose.yaml): Tracker V2 HTTP standalone deployment
- [track-https](./examples/track-https/compose.yaml): Tracker V2 HTTPS standalone deployment

**Distributed Deployment**:

- [video-storage](./examples/video-storage/compose.yaml): RTP storage
- [video-stream](./examples/video-stream/compose.yaml): RTP video

### 3. Configure `.env`

Create `/home/docker-compose/.env` file, refer to [.env.default](./.env.default) to override configuration items as needed.

Execute the following command in `/home/docker-compose` to verify all required values have been set:

```sh
docker compose config
```

After validation passes, execute the following command to export the compose configuration to a file, making it easier to compare differences after updating compose files:

```sh
docker compose config > compose-stack.yaml
```

### 4. Configure Frontend

Frontend override directories, used to place project-specific frontend configuration files such as `_app.config.js`:

- `/home/docker-compose/bus-override`: Bus frontend override directory
- `/home/docker-compose/track-override`: Track frontend override directory

**Note**: After modifying configurations, you need to execute `docker compose up` for the files to be copied to `/data/nginx/html/`. Since files are overwritten, it is not recommended to directly modify files in `/data/nginx/html/`.

### 5. Other Optional Configurations

- [jtt808 Video Conversion Tool](./jtt808/README.md)
- [Manual Frontend Download](./scripts/README.md)

### 6. Start

Execute the following command in `/home/docker-compose` to start docker:

```sh
docker compose up
```

### 7. Use git to Manage docker-compose Directory

Execute the following commands in `/home/docker-compose`:

```sh
# Change to the directory
cd /home/docker-compose

# After each configuration change, remember to backup the configuration for easy comparison of actual differences
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

## Important Notes

### Version Management
When updating versions, remember to synchronize the scripts under mysql:

```sh
# Bus frontend
BUS_WEB_VERSION=xxx
# Bus backend
BUS_GATEWAY_VERSION=xxx
#...
```
