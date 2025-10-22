#!/bin/bash
set -e
__dirname__=$(realpath "$(dirname "$0")")

BUILD_NAME="MaintainVbenAdmin_Release"
CONFIG_DIR="$__dirname__/distar"
DOWNLOAD_SCRIPT="$__dirname__"/teamcity-download-artifact.sh
DEPLOY_DIR="${DEPLOY_DIR:-/data/nginx/html/track/beta}"

print_help() {
  local bin_name=$(basename "$0")
  echo
  echo "部署 distar beta版"
  echo
  echo "Usage: $bin_name --tag=<tag> [--dir=<dir>]"
  echo
  echo "--tag: 标签名, 必填"
  echo "--deploy-dir: 部署目录, 默认为 /data/nginx/html/track/beta"
  echo
  echo "示例:"
  echo
  echo "$bin_name --tag=v1.14.0"
  echo
  echo "$bin_name --tag=v1.14.0 --dir=/data/nginx/html/track/test"
  echo
}

while [ $# -gt 0 ]; do
  case "$1" in
    --tag=*)
      version="${1#*=}"
      ;;
    --dir=*)
      DEPLOY_DIR="${1#*=}"
      ;;
    *)
      print_help
      exit 1
      ;;
  esac
  shift
done

# 检查版本号是否为空
if [ -z "$version" ]; then
  echo "版本号不能为空"
  print_help
  exit 1
fi

# 创建并切换到部署目录
[ -d "$DEPLOY_DIR" ] || mkdir -p "$DEPLOY_DIR" || (echo "创建部署目录失败" && exit 1)
cd "$DEPLOY_DIR"

# 替换点号并生成目标目录
target_dir="${version//./}"

# 定义文件名
zip_file="$BUILD_NAME-${version}.zip"

# 检查压缩文件是否存在，如果不存在则执行下载
if [ -f "$zip_file" ]; then
  read -p "压缩文件 $zip_file 已存在，是否重新下载？(y/n): " confirm
else
  confirm=y
fi

if [ "$confirm" == "y" ]; then
  echo "开始下载压缩文件 $zip_file ..."
  if [ "$version" == "latest" ]; then
    "$DOWNLOAD_SCRIPT" --build=$BUILD_NAME
  else
    "$DOWNLOAD_SCRIPT" --build=$BUILD_NAME --tag="$version"
  fi

  # 再次检查压缩文件是否存在
  if [ ! -f "$zip_file" ]; then
    echo "下载失败或文件仍然不存在！"
    exit 1
  fi
fi

# 如果目标目录存在则询问是否删除
if [ -d "$target_dir" ]; then
  read -p "目标目录 $target_dir 已存在，是否删除？(y/n): " confirm
  if [ "$confirm" != "y" ]; then
    echo "操作取消。"
    exit 1
  fi
  rm -rf "$target_dir"
  echo "删除文件夹 -> " "$target_dir"
fi

# 创建目标目录
mkdir -p "$target_dir"
echo "创建文件夹 -> " "$target_dir"

# 解压第一个zip文件
unzip -o -q "$zip_file" -d "$target_dir"

# 进入目标目录
cd "$target_dir"

# 定义临时zip文件名
temp_zip="maintain.zip"

# 检查第二个zip文件是否存在
if [ ! -f "$temp_zip" ]; then
  echo "临时压缩文件 $temp_zip 不存在！"
  exit 1
fi

# 解压第二个zip文件
unzip -o -q "$temp_zip"

# 删除临时zip文件
rm "$temp_zip"

cd ..
# 复制配置文件
cp -Rfv "$CONFIG_DIR"/* "$target_dir"

echo "解压完成,目录 -> " "$target_dir"
echo "beta路径,复制到浏览器可预览 -> " https://tripsdd.com/beta/"$target_dir"
