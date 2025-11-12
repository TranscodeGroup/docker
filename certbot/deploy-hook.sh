#!/bin/sh
set -e

cp -f "$RENEWED_LINEAGE/fullchain.pem" "$RENEWED_LINEAGE/certificate.crt"
cp -f "$RENEWED_LINEAGE/privkey.pem" "$RENEWED_LINEAGE/certificate.key"

echo "======================"
echo "请将证书变量设置为:"
echo "SSL_CERTIFICATE='${DATA_DIR:-/data}/certbot/live/$(basename "$RENEWED_LINEAGE")/certificate'"
echo

echo "重启Nginx..."
docker compose -p "${COMPOSE_PROJECT_NAME}" restart nginx
echo "重启完成"
echo "======================"
