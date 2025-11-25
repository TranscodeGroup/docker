#!/bin/bash
# ==============================================
# Nominatim 自动增量导入脚本（全自动扫描版）
# 自动检测 /nominatim/pbf 下新 PBF 文件
# ==============================================

# 配置参数
NOMINATIM_USER="nominatim"
NOMINATIM_DIR="/nominatim"
PBF_DIR="$NOMINATIM_DIR/pbf"
THREADS=${THREADS:-20}                 # 默认线程数
LOG_DIR="$NOMINATIM_DIR/import_logs"   # 日志目录
IMPORTED_LIST="$LOG_DIR/imported_files.txt"  # 已导入文件记录
APPEND_FLAG="--append"                 # 增量导入标志

# 创建日志目录和已导入记录文件
mkdir -p "$LOG_DIR"
touch "$IMPORTED_LIST"

# 查找所有 PBF 文件
PBF_FILES=$(find "$PBF_DIR" -maxdepth 1 -type f -name "*.osm.pbf" | sort)

if [[ -z "$PBF_FILES" ]]; then
  echo "[提示] $PBF_DIR 中没有 PBF 文件"
  exit 0
fi

# 遍历每个 PBF 文件
for OSM_FILE in $PBF_FILES; do
  BASENAME=$(basename "$OSM_FILE")

  # 检查是否已导入
  if grep -Fxq "$BASENAME" "$IMPORTED_LIST"; then
    echo "[跳过] 文件已导入过: $BASENAME"
    continue
  fi

  TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
  LOG_FILE="$LOG_DIR/${BASENAME%.*}_$TIMESTAMP.log"

  echo "===================================================="
  echo "[导入开始] $OSM_FILE"
  echo "日志文件: $LOG_FILE"
  echo "线程数: $THREADS"
  echo "===================================================="

  # 切换目录和权限
  cd "$NOMINATIM_DIR" || exit 1
  sudo chown -R $NOMINATIM_USER:$NOMINATIM_USER "$NOMINATIM_DIR"

  # 执行导入并记录日志
  sudo -E -u $NOMINATIM_USER nominatim import \
      --osm-file "$OSM_FILE" \
      $APPEND_FLAG \
      --threads $THREADS \
      2>&1 | tee "$LOG_FILE"

  # 标记为已导入
  echo "$BASENAME" >> "$IMPORTED_LIST"

  echo "[导入完成] $OSM_FILE"
done

echo "===================================================="
echo "所有新文件处理完成"
