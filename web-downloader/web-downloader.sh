#!/bin/sh
set -e

if [ -z "${TEAMCITY_BUILD_NAME}" ]; then
    echo "Please set these environment variables:"
    echo "TEAMCITY_BUILD_NAME, TEAMCITY_TAG, TEAMCITY_BUILD_ZIP_NAME, NGINX_HTML_DIR_NAME"
    exit 1
fi

cd /data/nginx/html || exit 1

version_file="${NGINX_HTML_DIR_NAME}/.version-for-web-downloader"

# Check if the version already exists
if [ -f "$version_file" ]; then
    current_version=$(cat "$version_file")
    if [ "$current_version" = "${TEAMCITY_TAG}" ]; then
        echo "Version ${TEAMCITY_TAG} already exists"
        exit 0
    fi
fi

# Download the new version
/home/docker/projects/teamcity-download-artifact.sh --build="${TEAMCITY_BUILD_NAME}" --tag="${TEAMCITY_TAG}"

# Unzip
unzip "${TEAMCITY_BUILD_NAME}-${TEAMCITY_TAG}.zip"
if [ -e "${NGINX_HTML_DIR_NAME}" ]; then
    rm -rf "${NGINX_HTML_DIR_NAME}"
fi
unzip "${TEAMCITY_BUILD_ZIP_NAME}" -d "${NGINX_HTML_DIR_NAME}"
# Clean up
rm -f "${TEAMCITY_BUILD_ZIP_NAME}"
# rm "${TEAMCITY_BUILD_NAME}-${TEAMCITY_TAG}.zip"
echo "${TEAMCITY_TAG}" > "$version_file"

echo
echo "Downloaded version ${TEAMCITY_TAG}"
echo
