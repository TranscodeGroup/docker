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
- [bus](./examples/bus/compose.yaml): Bus单机部署
- etc.

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
