## FFmpeg Static Compilation Installation

```bash
# Create tool folder
mkdir -p /home/docker-compose/opt
# Enter directory
cd /home/docker-compose/opt
# Download
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
# Decompress
tar -xvf ffmpeg-release-amd64-static.tar.xz
# Copy bin files
cp ./ffmpeg-*-amd64-static/ffmpeg ./ffmpeg-*-amd64-static/ffprobe /home/docker-compose/opt/
# Test
./ffmpeg -version
```

## Tongli ifv to mp4 tool (H264 is normal now, H265 is not supported by frontend player)

```bash
# Create tool folder
mkdir -p /home/docker-compose/opt/ifv2mp4
# Enter directory
cd /home/docker-compose/opt/ifv2mp4
# Download installer
wget https://github.com/TranscodeGroup/docker/releases/download/v1.0.2/tlgrectomp4_linux1.0.0.2.tar.gz
# Decompress
tar -xzvf tlgrectomp4_linux1.0.0.2.tar.gz
# Add path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/docker-compose/opt/ifv2mp4/release
# Verify
/home/docker-compose/opt/ifv2mp4/release/tlgrectomp4 --help
```

## Ensure jtt808 docker service includes the following configuration (Built-in for current version, manual padding for old version)

```bash
  jtt808:
    volumes:
      - /home/docker-compose/opt/ifv2mp4:/usr/local/bin/ifv2mp4
      - /home/docker-compose/opt/ffmpeg:/usr/local/bin/ffmpeg:ro
      - /home/docker-compose/opt/ffprobe:/usr/local/bin/ffprobe:ro
```
