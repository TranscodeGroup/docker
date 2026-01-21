## FFmpeg Static Build Installation

```bash
# Create tools directory
mkdir -p /home/docker-compose/opt
# Enter directory
cd /home/docker-compose/opt
# Download
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
# Extract
tar -xvf ffmpeg-release-amd64-static.tar.xz
# Copy bin files
cp ./ffmpeg-*-amd64-static/ffmpeg ./ffmpeg-*-amd64-static/ffprobe /home/docker-compose/opt/
# Test
./ffmpeg -version
```

## Tongli IFV to MP4 Conversion Tool (H264 works normally, H265 is not supported by frontend player yet)

```bash
# Create tools directory
mkdir -p /home/docker-compose/opt/ifv2mp4
# Enter directory
cd /home/docker-compose/opt/ifv2mp4
# Download installation program
wget https://github.com/TranscodeGroup/docker/releases/download/v1.0.2/tlgrectomp4_linux1.0.0.2.tar.gz
# Extract
tar -xzvf tlgrectomp4_linux1.0.0.2.tar.gz
# Add path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/docker-compose/opt/ifv2mp4/release
# Verify
/home/docker-compose/opt/ifv2mp4/release/tlgrectomp4 --help
```

## Ensure jtt808 Docker Service Includes the Following Configuration (built-in in current version, manual addition required for older versions)

```bash
  jtt808:
    volumes:
      - /home/docker-compose/opt/ifv2mp4:/usr/local/bin/ifv2mp4
      - /home/docker-compose/opt/ffmpeg:/usr/local/bin/ffmpeg:ro
      - /home/docker-compose/opt/ffprobe:/usr/local/bin/ffprobe:ro
```
