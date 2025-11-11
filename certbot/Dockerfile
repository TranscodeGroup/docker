# 支持100+DNS提供商的Certbot插件
# 详见: https://github.com/alexzorin/certbot-dns-multi
FROM ghcr.io/alexzorin/certbot-dns-multi:4.27.0

# 添加docker和docker compose命令
COPY --from=docker:cli /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker:cli /usr/local/libexec/docker/cli-plugins/docker-compose /usr/local/libexec/docker/cli-plugins/docker-compose
