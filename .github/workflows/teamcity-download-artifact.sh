#!/bin/bash

# 默认使用名为artifacts的token, 权限较小(被设置为: `<Root project>: View build runtime parameters and data`)
# @see http://th-ci.transcodegroup.cn:9080/profile.html?item=accessTokens
TOKEN="${TEAMCITY_TOKEN:-eyJ0eXAiOiAiVENWMiJ9.bnBsa01KRlZPMlQ3WHZpM2hDZnJVN3p3dFAw.NzNjYTA4NTctMWE5Ny00MWRkLTg2ZDktOWI2NDYxMGZiZjll}"
HOST="http://th-ci.transcodegroup.cn:9080"

print_help() {
  bin_name=$(basename "$0")
  echo "下载 TeamCity 构建存档"
  echo
  echo "Usage: $bin_name --build=<build> [--tag=<tag>]"
  echo
  echo "--build: 构建的名称, 例如: MaintainVbenAdmin_Release, 必填"
  echo "--tag: 标签名, 若不填, 则下载最后一次的构建"
  echo
  echo "示例:"
  echo
  echo "1. 下载maintain-vben-admin/Release中v1.14.0版本的存档"
  echo "$bin_name --build=MaintainVbenAdmin_Release --tag=v1.14.0"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --tag=*)
      TAG="${1#*=}"
      ;;
    --build=*)
      BUILD="${1#*=}"
      ;;
    *)
      print_help
      exit 1
      ;;
  esac
  shift
done

if [ -z "$BUILD" ]; then
  print_help
  exit 1
fi

if [ -n "$TAG" ]; then
  # locator的value包含`/`时, 需要进行base64编码
  # @see https://www.jetbrains.com/help/teamcity/rest/locators.html#e20589c5
  encoded_tag="$(printf '%s' "tags/$TAG" | base64)"
  branch_locator="branch:(\$base64:$encoded_tag)"
else
  branch_locator="branch:(policy:ALL_BRANCHES)"
fi
build_locator="buildType:$BUILD,status:SUCCESS,state:finished,$branch_locator"

# @see https://www.jetbrains.com/help/teamcity/rest/manage-finished-builds.html#Get+Build+Artifacts
download_artifacts() {
  _output="${BUILD}-${TAG:-latest}.zip"
  if ! curl \
    --fail \
    --header "Authorization: Bearer $TOKEN" \
    --output "$_output" \
    "${HOST}/app/rest/builds/${build_locator}/artifacts/archived/"; then
    echo "下载存档失败!"
    exit 1
  fi
}

# @see https://www.jetbrains.com/help/teamcity/rest/get-build-details.html
print_build_info() {
  curl \
    --header "Authorization: Bearer $TOKEN" \
    "${HOST}/app/rest/builds/${build_locator}"
}

# print_build_info
download_artifacts
