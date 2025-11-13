#!/bin/sh
set -e

cp -f "$RENEWED_LINEAGE/fullchain.pem" "$RENEWED_LINEAGE/certificate.crt"
cp -f "$RENEWED_LINEAGE/privkey.pem" "$RENEWED_LINEAGE/certificate.key"

echo "======================"
echo "请将证书变量设置为:"
echo "SSL_CERTIFICATE='${DATA_DIR:-/data}/certbot/live/$(basename "$RENEWED_LINEAGE")/certificate'"
echo

echo "正在查找包含'nginx'的服务..."
nginx_services=$(docker compose -p "${COMPOSE_PROJECT_NAME}" ps --services | grep nginx || true)

if [ -n "$nginx_services" ]; then
    echo "重启 $nginx_services 中..." | tr '\n' ' '
    echo
    echo "$nginx_services" | xargs docker compose -p "${COMPOSE_PROJECT_NAME}" restart
    echo "重启完成"
else
    echo "未找到包含'nginx'的服务"
fi
echo "======================"
