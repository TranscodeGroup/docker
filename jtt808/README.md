## FFmpeg Static Compilation Installation

```bash
# Create tool folder
mkdir -p /home/docker-compose/opt
# Enter directory
cd /home/docker-compose/opt
# Download
# 旧版7x(废弃)
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
# 新版8.1
wget https://github.com/BtbN/FFmpeg-Builds/releases/download/autobuild-2026-06-14-13-33/ffmpeg-n8.1.1-117-g7aecd49777-linux64-gpl-8.1.tar.xz
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
wget https://github.com/TranscodeGroup/docker/releases/download/v1.0.4/tlgrectomp4_linux1.0.0.4.tar.gz
# Decompress
tar -xzvf tlgrectomp4_linux1.0.0.4.tar.gz
# Add path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/docker-compose/opt/ifv2mp4/release
# Verify
/home/docker-compose/opt/ifv2mp4/release/tlgrectomp4 --help
```
