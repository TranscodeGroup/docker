# docker

docker配置文件仓库

## 部署

### 1. 初始化

```sh
git clone https://github.com/TranscodeGroup/docker.git /home/docker
mkdir /data
mkdir /docker-compose
```

### 2. 配置compse.yaml

创建`/home/docker-compose/compose.yaml`文件, 参考如下示例, 组合需要的服务成为一个compose文件:

- [compose-video.yaml](./compose-video.yaml)

### 3. 配置.env

创建`/home/docker-compose/.env`文件, 参考[.env.default](./.env.default)复写需要改写的配置项.

使用在`/home/docker-compose`中执行如下命令, 验证所有使用到的必填的值, 是否已经设置:

```sh
docker compose config
```
