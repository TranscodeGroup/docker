#!/bin/sh
set -e

cp "$RENEWED_LINEAGE/fullchain.pem" "$RENEWED_LINEAGE/certificate.crt"
cp "$RENEWED_LINEAGE/privkey.pem" "$RENEWED_LINEAGE/certificate.key"

echo "请保证将证书变量设置为:"
echo "SSL_CERTIFICATE=${DATA_DIR:-/data}/certbot/live/$(basename "$RENEWED_DOMAINS")/certificate"

echo "重启Nginx..."
docker compose -p "${COMPOSE_PROJECT_NAME}" restart nginx
