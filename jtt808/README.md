## FFmpeg 静态编译安装

```bash
# 创建工具文件夹
mkdir -p /home/docker-compose/opt
# 进入目录
cd /home/docker-compose/opt
# 下载
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
# 解压
tar -xvf ffmpeg-release-amd64-static.tar.xz
# 复制bin文件
cp ./ffmpeg-*-amd64-static/ffmpeg ./ffmpeg-*-amd64-static/ffprobe /home/docker-compose/opt/
# 测试
./ffmpeg -version
```

## 通力ifv转mp4工具(现在H264正常, H265前端播放器不支持)

```bash
# 创建工具文件夹
mkdir -p /home/docker-compose/opt/ifv2mp4
# 进入目录
cd /home/docker-compose/opt/ifv2mp4
# 下载安装程序
wget https://github.com/TranscodeGroup/docker/releases/download/v1.0.2/tlgrectomp4_linux1.0.0.2.tar.gz
# 解压
tar -xzvf tlgrectomp4_linux1.0.0.2.tar.gz
# 增加路径
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/docker-compose/opt/ifv2mp4/release
# 验证
/home/docker-compose/opt/ifv2mp4/release/tlgrectomp4 --help
```

## 确保jtt808的docker服务包含如下配置(当前版本已内置, 旧版手工补齐)

```bash
  jtt808:
    volumes:
      - /home/docker-compose/opt/ifv2mp4:/usr/local/bin/ifv2mp4
      - /home/docker-compose/opt/ffmpeg:/usr/local/bin/ffmpeg:ro
      - /home/docker-compose/opt/ffprobe:/usr/local/bin/ffprobe:ro
```
