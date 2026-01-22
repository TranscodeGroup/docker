<div align="center"> <a href="./README.en.md">English</a> | 简体中文 </div>

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

**单机单独部署**:

- [bus-http](./examples/bus-http/compose.yaml): Bus http单机部署
- [bus-https](./examples/bus-https/compose.yaml): Bus https单机部署
- [track-http](./examples/track-http/compose.yaml): Tracker V2 http单机部署
- [track-https](./examples/track-https/compose.yaml): Tracker V2 https单机部署

**分布式部署**:

- [video-storage](./examples/video-storage/compose.yaml): RTP存储
- [video-stream](./examples/video-stream/compose.yaml): RTP视频

### 3. 配置`.env`

创建`/home/docker-compose/.env`文件, 参考[default.env](./default.env)复写需要改写的配置项.

在`/home/docker-compose`中执行如下命令, 校验所有使用到的必填的值, 是否已经设置:

```sh
docker compose config
```

校验通过之后, 执行如下命令, 将compose配置导出成一个文件, 方便在更新compose文件后对比差异:

```sh
docker compose config > compose-stack.yaml
```

### 4. 配置前端

前端复写目录, 用来放`_app.config.js`等项目特定的前端配置文件:

- `/home/docker-compose/bus-override`: bus前端复写目录
- `/home/docker-compose/track-override`: track前端复写目录

**注意**: 修改完配置后, 需要执行`docker compose up`, 文件才会被覆盖到`/data/nginx/html/`里面去. 因为是使用的覆盖的方式, 因此不建议直接修改`/data/nginx/html/`里面的文件.

### 5. 其他可选配置

- [jtt808视频转换工具](./jtt808/README.md)
- [手动下载前端](./scripts/README.md)

### 6. 启动

在`/home/docker-compose`中执行如下命令, 启动docker:

```sh
docker compose up
```

### 7. 使用git管理docker-compose目录

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
