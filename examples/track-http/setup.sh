#!/bin/bash
cd "$(dirname "$0")"

ENV_FILE=".env"

# 如果文件不存在，创建一个空的
if [ ! -f "$ENV_FILE" ]; then
    touch "$ENV_FILE"
fi

# 辅助函数：获取 .env 中的值
get_env_value() {
    # 使用 grep 查找 key，然后用 cut/sed 提取值，去除引号
    # 匹配 key='value' 或 key=value
    grep "^$1=" "$ENV_FILE" | sed -E "s/^$1=['"]?(.*)['"]?$/\1/" | tail -n 1
}

# 辅助函数：更新或追加 .env 中的值
set_env_value() {
    local key="$1"
    local val="$2"
    
    if grep -q "^$key=" "$ENV_FILE"; then
        # 如果存在，使用 sed 替换 (针对 Linux 和 Mac 的 sed 兼容性，这里使用临时文件)
        # 匹配 key='...' 或 key=... 并替换
        sed -i.bak "s|^$key=.*|$key='$val'|" "$ENV_FILE" && rm "$ENV_FILE.bak"
    else
        # 如果不存在，追加到文件末尾
        # 确保文件末尾有换行
        [ -n "$(tail -c1 "$ENV_FILE")" ] && echo "" >> "$ENV_FILE"
        echo "$key='$val'" >> "$ENV_FILE"
    fi
}

echo "========================================"
echo "Track-HTTP 智能补全部署配置"
echo "========================================"

# 1. 处理 IP
CURRENT_IP=$(get_env_value "SERVER_IP_PUBLIC")
# 去除可能的回车符
CURRENT_IP=$(echo "$CURRENT_IP" | tr -d '\r')

if [ -z "$CURRENT_IP" ]; then
    read -p "请输入服务器公网IP (Enter Public IP): " SERVER_IP_PUBLIC
    if [ -z "$SERVER_IP_PUBLIC" ]; then
        echo "错误: IP地址不能为空."
        exit 1
    fi
    set_env_value "SERVER_IP_PUBLIC" "$SERVER_IP_PUBLIC"
    
    # 检查 HOSTNAME 是否设置，如果没有也设置为 IP
    CURRENT_HOST=$(get_env_value "SERVER_HOSTNAME")
    if [ -z "$CURRENT_HOST" ]; then
        set_env_value "SERVER_HOSTNAME" "$SERVER_IP_PUBLIC"
    fi
    
    echo "已设置 IP: $SERVER_IP_PUBLIC"
else
    echo "使用现有 IP: $CURRENT_IP"
fi

# 2. 处理密码
generate_password() {
    if command -v openssl &> /dev/null; then
        openssl rand -base64 15 | tr -dc 'a-zA-Z0-9' | head -c 12
    else
        tr -dc A-Za-z0-9 </dev/urandom | head -c 12
    fi
}

PASSWORDS=(
    "MYSQL_PASSWORD"
    "REDIS_PASSWORD"
    "MONGODB_PASSWORD"
    "RABBITMQ_PASSWORD"
    "MINIO_PASSWORD"
    "MAIL_PASSWORD"
)

echo "正在检查密码配置..."

for key in "${PASSWORDS[@]}"; do
    current_val=$(get_env_value "$key")
    current_val=$(echo "$current_val" | tr -d '\r')
    
    if [ -z "$current_val" ]; then
        new_pass=$(generate_password)
        set_env_value "$key" "$new_pass"
        echo "  [已补全] $key"
    else
        echo "  [已存在] $key (保持不变)"
    fi
done

echo "----------------------------------------"
echo "配置检查完成！(.env updated)"
echo "现在你可以运行: docker compose up -d"