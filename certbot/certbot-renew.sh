#!/bin/sh
set -e

renewed_domains="/etc/letsencrypt/renewed_domains"

rm -f "$renewed_domains"

docker run --rm -it \
    -v /etc/letsencrypt:/etc/letsencrypt \
    ghcr.io/alexzorin/certbot-dns-multi:4.27.0 \
    certonly \
    --non-interactive --agree-tos \
    --authenticator dns-multi \
    --dns-multi-credentials /etc/letsencrypt/dns-multi.ini \
    --domains "*.example.com" \
    --deploy-hook "echo \${RENEWED_DOMAINS} >> $renewed_domains" \
    --dry-run

if [ -f "$renewed_domains" ]; then
    while IFS= read -r line; do
        cp -v "$line/fullchain.pem" "$line/xx.crt"
        cp -v "$line/privkey.pem" "$line/xx.key"
    done < "$renewed_domains"
else
    echo "No domains to renew"
fi
