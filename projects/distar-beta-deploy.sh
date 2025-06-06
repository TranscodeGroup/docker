#!/bin/bash
set -e
__dirname__=$(realpath "$(dirname "$0")")

BUILD_NAME="MaintainVbenAdmin_Release"
CONFIG_DIR="$__dirname__/distar"
DOWNLOAD_SCRIPT="$__dirname__"/teamcity-download-artifact.sh
DEPLOY_DIR="${DEPLOY_DIR:-/data/nginx/html/track/beta}"

# 创建并切换到部署目录
[ -d "$DEPLOY_DIR" ] || mkdir -p "$DEPLOY_DIR" || (echo "创建部署目录失败" && exit 1)
cd "$DEPLOY_DIR"

# 检查参数是否提供
if [ -z "$1" ]; then
  echo "使用方式: $0 --tag=版本号"
  exit 1
fi

# 解析参数
for arg in "$@"
do
  case $arg in
    --tag=*)
    version="${arg#*=}"
    shift # 移除已处理的参数
    ;;
    *)
    echo "未知参数: $arg"
    exit 1
    ;;
  esac
done

# 检查版本号是否为空
if [ -z "$version" ]; then
  echo "版本号不能为空"
  exit 1
fi

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

# 指定要处理的HTML文件
cd "$target_dir"
html_file="index.html"

# 使用sed命令进行文本替换, 网站微缩图
OLD_TITLE='中车在线'
NEW_TITLE='DiStarGPS'
OLD_DIV='数字交通云平台'
NEW_DIV='ดูแลการเดินรถของคุ'

# 使用sed命令进行文本替换
sed -i.bak "s|$OLD_TITLE|$NEW_TITLE|g" "$html_file"
sed -i.bak "s|$OLD_DIV|$NEW_DIV|g" "$html_file"
rm "$html_file".bak

echo "替换完成：$html_file 中的 '工物员' 已被替换为 'DiStarGPS ดูแลการเดินรถของคุณ'"

echo "解压完成,目录 -> " "$target_dir"
echo "beta路径,复制到浏览器可预览 -> " https://tripsdd.com/beta/"$target_dir"
