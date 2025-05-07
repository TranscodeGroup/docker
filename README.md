# docker

docker配置文件仓库

## 部署

### 1. 初始化

```sh
mkdir -p /home/docker-compose
mkdir /data
git clone https://github.com/TranscodeGroup/docker.git /home/docker
```

### 2. 配置`compse.yaml`

创建`/home/docker-compose/compose.yaml`文件, 参考如下示例:

- [video-storage](./examples/video-storage/compose.yaml): RTP存储
- [video-stream](./examples/video-stream/compose.yaml): RTP视频
- [track](./examples/track/compose.yaml): Tracker V2单机部署

### 3. 配置`.env`

创建`/home/docker-compose/.env`文件, 参考[.env.default](./.env.default)复写需要改写的配置项.

在`/home/docker-compose`中执行如下命令, 验证所有使用到的必填的值, 是否已经设置:

```sh
docker compose config
```

### 4. 启动

在`/home/docker-compose`中执行如下命令, 启动docker:

```sh
docker compose up
```
