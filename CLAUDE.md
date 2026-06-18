# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the Docker Compose configuration repository for TranscodeGroup's fleet/vehicle tracking platform. It does not contain application source code; it packages and orchestrates pre-built backend/frontend images and infrastructure services (MySQL, Redis, MongoDB, RabbitMQ, MinIO, nginx, SRS, etc.).

The repo is deployed to `/home/docker` on target servers. Runtime configuration and compose overrides live in `/home/docker-compose`, and persistent data is written to `/data`.

## Common Commands

All compose commands are run from `/home/docker-compose`, where the top-level `compose.yaml` and `.env` files reside.

```sh
# Validate compose configuration and required environment variables
docker compose config

# Export resolved compose config for diff review
docker compose config > compose-stack.yaml

# Start the stack in the background
docker compose up -d

# Recreate a specific service after changing its config/image
docker compose up -d --force-recreate <service>

# Follow logs for a service
docker compose logs -f <service>

# Validate that initdb INSERT statements match CREATE TABLE column counts
node /home/docker/scripts/check-init-sql.js
```

When modifying `mysql8/initdb/*.sql`, run `check-init-sql.js` before committing to catch column/value mismatches.

## High-Level Architecture

### Modular Compose Layout

Each top-level directory (`maintain/`, `jtt808/`, `bus/`, `video/`, `mysql8/`, `nginx/`, etc.) contains one or more focused `compose.yml` fragments. These fragments are assembled by the example deployments in `examples/` using Docker Compose `include`:

- `examples/track-http/compose.yaml` — Tracker V2 single-node HTTP deployment.
- `examples/track-https/compose.yaml` — Tracker V2 single-node HTTPS deployment.
- `examples/bus-http/compose.yaml` / `examples/bus-https/compose.yaml` — Bus platform single-node deployments.
- `examples/video-storage/compose.yaml` / `examples/video-stream/compose.yaml` — Distributed video storage/streaming nodes.

A deployment typically `include`s shared infrastructure (mysql8, redis, mongodb, rabbitmq, minio), one or more backend service fragments, nginx fragments, and optional video or web-downloader fragments.

### Two Primary Products

1. **Tracker V2 (track)**
   - `maintain` — Spring Boot backend (`transcodegroup/maintain-server`), the main API and device registry.
   - `jtt808` — JT/T 808 device gateway (`transcodegroup/jtt808-server`), handles terminal connections and forwards to `maintain`.
   - `video` — SRS + RTP streaming stack for live video, playback, talk, and monitor.
   - `nginx` — Reverse proxy and static frontend host for the `track` web app.

2. **Bus**
   - `gateway_808_2019` — JT/T 808 gateway for the Bus product (`transcodegroup/gateway-808-2019`).
   - `gateway_web` — Spring Boot web backend (`transcodegroup/gateway-web`).
   - `gateway_dispatch` — Spring Boot scheduler (`transcodegroup/gateway-dispatch`).
   - `gateway_jsatl12` — Active-safety alarm file gateway (`transcodegroup/gateway-jsatl12`).
   - `nginx` — Reverse proxy and static frontend host for the `bus` web app.

Both products share the same infrastructure services but use different MySQL databases (`maintain` vs `cbus`).

### Configuration and Data Layout

- `/home/docker` — This repository.
- `/home/docker-compose/compose.yaml` — Deployment-specific composition, created from an `examples/` template.
- `/home/docker-compose/.env` — Runtime overrides, created from `default.env`.
- `/data` — All persistent runtime data (MySQL data, logs, uploaded files, nginx html, SRS recordings, etc.).
- `/home/docker-compose/bus-override/` and `/home/docker-compose/track-override/` — Frontend override directories. Files here are copied into `/data/nginx/html/` when nginx starts. Use these to override `_app.config.js`, `index-seo.html`, favicons, and logos instead of editing `/data/nginx/html/` directly.
- `/home/docker-compose/token/` — JWT RSA key pairs and `ip2region.xdb`.
- `/home/docker-compose/opt/` — Optional host binaries mounted into containers, e.g. `ffmpeg`, `ffprobe`, and `ifv2mp4` for the jtt808 video-conversion tools.

### MySQL Initialization

`mysql8/compose.yml` mounts `mysql8/initdb/` into `/docker-entrypoint-initdb.d`. Scripts run once on the first container startup, before the application connects. The directory is split into table-definition and seed-data files per logical database (`maintain`, `cbus`, etc.). When altering these schemas, update the corresponding seed `INSERT`s and validate with `scripts/check-init-sql.js`.

### Networking and Service Discovery

Services within the same compose project resolve each other by service name. Common aliases used in environment variables:

- `mysql8`, `redis`, `mongodb`, `rabbitmq`, `minio`, `nginx`, `jtt808`, `maintain`, `srs`, `rtp`.

External access is exposed through `nginx` (ports 80/443 by default) and, for device protocols, directly through `jtt808` / `gateway_808_2019` / `video` RTP ports.

### Frontend Deployment

Frontend artifacts are not built here. They are downloaded from CI artifacts using `scripts/teamcity-download-artifact.sh` or deployed from tagged GitHub releases using `scripts/distar-beta-deploy.sh`. See `scripts/README.md` and `jtt808/README.md` for exact commands.

## Important Notes

- Most compose fragments rely on environment variables marked `{?required}` in their image tags or env vars. Always run `docker compose config` before `up` to catch missing values.
- MySQL init scripts only execute on a fresh data volume. To re-run them you must wipe `/data/mysql8/data`, which destroys all data.
- The `100-init-partition-table.sql` script uses `USE maintain;` and `USE cbus;` to create monthly partitions for large tables (position, alarm, depart_arrive).
- HTTPS deployments need a valid certificate path in `.env`. For testing, use the built-in placeholder cert at `${DOCKER_DIR}/nginx/ssl/placeholder`.
- GitHub Actions in `.github/workflows/` only manage project board automation and PR author assignment; they do not build or test this repo.

## Related Documentation

- `README.md` / `README.en.md` — Deployment quick-start.
- `scripts/README.md` — Frontend artifact download and distar deployment scripts.
- `jtt808/README.md` — FFmpeg and IFV-to-MP4 tooling setup.
- `default.env` / `default.en.env` — Full list of configurable environment variables.
