# Automation Scripts

## Manually download frontend: `teamcity-download-artifact.sh`

Download and extract the latest `bus` frontend:

```sh
cd /data/nginx/html
/home/docker/scripts/teamcity-download-artifact.sh --build=CityBusVueAdmin_Release
unzip CityBusVueAdmin_Release-latest.zip
unzip bus.zip -d bus
```

Download and extract the latest `track` frontend:

```sh
cd /data/nginx/html
/home/docker/scripts/teamcity-download-artifact.sh --build=MaintainVbenAdmin_Release
unzip MaintainVbenAdmin_Release-latest.zip
unzip maintain.zip -d track
```

## Deploy distar frontend: `distar-beta-deploy.sh`

```sh
# Confirm that the https://github.com/TranscodeGroup/maintain-vben-admin repository has the corresponding version tag
# Confirm that http://th-ci.transcodegroup.cn:9080/buildConfiguration/MaintainVbenAdmin_Release has packaged the attachment

# Download tag version to default directory, and extract to the version corresponding folder
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1

# Download tag version to current directory
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1 --dir=.

# Download tag version to /data/nginx/html directory
/home/docker/scripts/distar-beta-deploy.sh --tag=v1.15.1 --dir=/data/nginx/html
```