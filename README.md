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

> 单机单独部署

- [bus-http](./examples/bus-http/docker-compose/compose.yaml): Bus-http单机部署
- [bus-https](./examples/bus-https/docker-compose/compose.yaml): Bus-https单机部署
- [track](./examples/track/compose.yaml): Tracker V2单机部署

> 分布式部署

- [video-storage](./examples/video-storage/compose.yaml): RTP存储
- [video-stream](./examples/video-stream/compose.yaml): RTP视频

### 3. 配置`.env`

创建`/home/docker-compose/.env`文件, 参考[.env.default](./.env.default)复写需要改写的配置项.

在`/home/docker-compose`中执行如下命令, 校验所有使用到的必填的值, 是否已经设置:

```sh
docker compose config
```

校验通过之后, 执行如下命令, 将compose配置导出成一个文件, 方便在更新compose文件后对比差异:

```sh
docker compose config > compose-stack.yaml
```

### 4. 下载前端文件

要手动下载前端, 详见: [说明文件](./scripts/README.md)

要自动下载前端, 只需要在`/home/docker-compose/compose.yaml`文件中, `include`如下服务:

```yaml
include:
  # ...
  - path:
    - ../docker/web-downloader/compose.yml        # 自动下载的基础配置
    - ../docker/web-downloader/compose.track.yml  # 自动下载track, 可选
    - ../docker/web-downloader/compose.bus.yml    # 自动下载bus, 可选
```

### 5. 启动

在`/home/docker-compose`中执行如下命令, 启动docker:

```sh
docker compose up
```

### 6. 配置版本管理

在`/home/docker-compose`中执行如下命令

```sh
# 切换到目录下面
cd /home/docker-compose 

# 每次修改配置之后, 记得备份一下配置, 方便对比实际影响差异
docker compose config > compose-stack.yaml

# 配置GIT账号
git config --global user.name "tg"
git config --global user.email tg@gmail.com

# 初始化GIT
git init
# 加入暂存区
git add -A
# 提交本地仓库
git commit -m "Initial commit(初始化仓库)"
```

### 7. 其他注意事项

#### 版本管理, 版本迭代同时, 记得同步mysql下面的脚本

```sh
# bus前端
BUS_WEB_VERSION=5.31.0
# bus的后端
BUS_GATEWAY_VERSION=1.23.0
# 公交808-2019版本号
BUS_GATEWAY_808_2019_VERSION=25.8.25
# 公交主动安全版本号
BUS_GATEWAY_JSATL12_VERSION=23.1.21

# track前端
TRACK_WEB_VERSION=1.53.0
# track后端
TRACK_MAINTAIN_VERSION=1.45.0
TRACK_JTT808_VERSION=1.18.0
```

#### 前端文件复写

```sh
# bus前端文件复写目录, 该目录中的文件会在compose被up时被复制到bus前端目录, 通常可以复写如下文件:
# - _app.config.js: 前端配置文件
BUS_WEB_OVERRIDE_DIR=${DOCKER_COMPOSE_DIR}/bus-override

# track前端文件复写目录, 该目录中的文件会在compose被up时被复制到track前端目录, 通常可以复写如下文件:
# - _app.config.js: 前端配置文件
# - index-seo.html: 交给爬虫(搜索引擎/Line网页摘要等)读取的静态页面
# - favicon.ico: ico图标
# - favicon.png: png图标
# - logo.png: 大图标
TRACK_WEB_OVERRIDE_DIR=${DOCKER_COMPOSE_DIR}/track-override

```
