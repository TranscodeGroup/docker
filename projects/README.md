# 项目特定的配置

## distar前端

```sh
# 确认https://github.com/TranscodeGroup/maintain-vben-admin仓库存在对应的版本tag
# 确认 https://xn.transcodegroup.cn:8590/buildConfiguration/MaintainVbenAdmin_Release?mode=builds 已经打包出附件

# 下载tag版本到默认目录, 并解压到版本对应的文件夹
/home/docker/projects/distar-beta-depoly.sh --tag=v1.15.1

# 下载tag版本到当前目录
DEPLOY_DIR=. /home/docker/projects/distar-beta-depoly.sh --tag=v1.15.1

# 下载tag版本到/data/nginx/html目录
DEPLOY_DIR=/data/nginx/html /home/docker/projects/distar-beta-depoly.sh --tag=v1.15.1
```
