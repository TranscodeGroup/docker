## FFmpeg 静态编译安装

```bash
# 进入目录
cd /home/docker-compose
# 下载
wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
# 解压
tar -xvf ffmpeg-release-amd64-static.tar.xz
# 进入源目录
cd ffmpeg-*-amd64-static
# 复制新目录
sudo cp ffmpeg ffprobe /home/docker-compose/opt/
# 测试
ffmpeg -version
```

## 通力ifv转mp4工具(现在H264正常, H265前端播放器不支持)

```bash
# 目录
cd /home/docker-compose/opt
# 创建工具文件夹
mkdir ifv2mp4

# @DO 上传通力给的工具 tlgrectomp4_linux1.0.0.2.tar.gz 到 ifv2mp4目录, 或者上传到http服务器上提供wget下载

# 解压
tar -xzvf tlgrectomp4_linux1.0.0.2.tar.gz

# 增加路径
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/docker-compose/opt/ifv2mp4/release

# 验证
/home/docker-compose/opt/ifv2mp4/release/tlgrectomp4 input.ifv output.mp4

```

## 确保jtt808的docker服务包含如下配置(当前版本已内置, 旧版手工补齐)

```bash
  jtt808:
    volumes:
      - /home/docker-compose/opt/ifv2mp4:/usr/local/bin/ifv2mp4
      - /home/docker-compose/opt/ffmpeg:/usr/local/bin/ffmpeg:ro
      - /home/docker-compose/opt/ffprobe:/usr/local/bin/ffprobe:ro
```
