# 自动化脚本

## 手动下载前端: `teamcity-download-artifact.sh`

下载并提取最新的`bus`前端:

```sh
cd /data/nginx/html
/home/docker/scripts/teamcity-download-artifact.sh --build=CityBusVueAdmin_Release
unzip CityBusVueAdmin_Release-latest.zip
unzip bus.zip -d bus
```

下载并提取最新的`track`前端:

```sh
cd /data/nginx/html
/home/docker/scripts/teamcity-download-artifact.sh --build=MaintainVbenAdmin_Release
unzip MaintainVbenAdmin_Release-latest.zip
unzip maintain.zip -d track
```

## 部署distar前端: `distar-beta-deploy.sh`

```sh
# 确认https://github.com/TranscodeGroup/maintain-vben-admin仓库存在对应的版本tag
# 确认 http://th-ci.transcodegroup.cn:9080/buildConfiguration/MaintainVbenAdmin_Release 已经打包出附件

# 下载tag版本到默认目录, 并解压到版本对应的文件夹
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1

# 下载tag版本到当前目录
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1 --dir=.

# 下载tag版本到/data/nginx/html目录
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1 --dir=/data/nginx/html
```
