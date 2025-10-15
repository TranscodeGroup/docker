# 项目特定的配置

## distar前端

```sh
# 确认https://github.com/TranscodeGroup/maintain-vben-admin仓库存在对应的版本tag
# 确认 http://th-ci.transcodegroup.cn:9080/buildConfiguration/MaintainVbenAdmin_Release 已经打包出附件

# 下载tag版本到默认目录, 并解压到版本对应的文件夹
/home/docker/projects/distar-beta-deploy.sh --tag=v1.15.1

# 下载tag版本到当前目录
/home/docker/projects/distar-beta-deploy.sh --tag=v1.15.1 --dir=.

# 下载tag版本到/data/nginx/html目录
/home/docker/projects/distar-beta-deploy.sh --tag=v1.15.1 --dir=/data/nginx/html
```
