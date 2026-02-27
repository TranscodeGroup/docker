# pt-archiver 数据归档脚本

该脚本用于将 MySQL 表中的历史数据从源数据库归档到目标数据库，基于 `percona-toolkit` 的 `pt-archiver` 工具，并以 Docker 方式运行。

## 脚本内容

```bash
#!/bin/bash
set -euo pipefail
#set -x

# ====== 源数据库 ======
SRC_HOST=127.0.0.1
SRC_PORT=3306
SRC_USER=root
SRC_PASS=xxxx
SRC_DB=maintain
SRC_TABLE=jtt808_position

# ====== 归档目标数据库 ======
DST_HOST=127.0.0.1
DST_PORT=3306
DST_USER=root
DST_PASS=xxxx
DST_DB=maintain
DST_TABLE=jtt808_position_history

# ====== 归档参数：开始ID，结束ID，每次批量归档数量 ======
START_ID=0
END_ID=100000
BATCH_SIZE=30000

LOG_DIR=/var/log/pt-archiver
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/archive_$(date +%F_%H%M%S).log"

# ====== 构造 where 条件 ======
WHERE="id > ${START_ID} AND id <= ${END_ID}"

# ====== 执行归档 ======
docker run --rm -t --network host \
  -e LANG=C.UTF-8 -e PERL_UNICODE=SDA \
  percona/percona-toolkit \
  pt-archiver \
    --source h=$SRC_HOST,P=$SRC_PORT,u=$SRC_USER,p=$SRC_PASS,D=$SRC_DB,t=$SRC_TABLE,L=1,A=utf8mb4 \
    --dest   h=$DST_HOST,P=$DST_PORT,u=$DST_USER,p=$DST_PASS,D=$DST_DB,t=$DST_TABLE,L=1,A=utf8mb4 \
    --charset=utf8mb4 \
    --where "$WHERE" \
    --limit $BATCH_SIZE \
    --bulk-insert \
    --nosafe-auto-increment \
    --no-delete \
    --progress 10000 \
    --sleep 1 \
    --statistics \
  2>&1 | tee -a "$LOG_FILE"

echo "Archive finished at $(date)" >> "$LOG_FILE"
```