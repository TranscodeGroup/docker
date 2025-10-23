#!/bin/sh
set -e

if [ -z "${TEAMCITY_BUILD_NAME}" ]; then
    echo "Please set these environment variables:"
    echo "TEAMCITY_BUILD_NAME, TEAMCITY_TAG, TEAMCITY_BUILD_ZIP_NAME, NGINX_HTML_DIR_NAME, NGINX_HTML_OVERRIDE_DIR"
    exit 1
fi

cd /data/nginx/html || exit 1

version_file="${NGINX_HTML_DIR_NAME}/.version-for-web-downloader"
override_dir="${NGINX_HTML_OVERRIDE_DIR:-"${NGINX_HTML_DIR_NAME}-override"}"

cp_override_files () {
    if [ -d "$override_dir" ]; then
        echo "Copy $override_dir into ${NGINX_HTML_DIR_NAME}..."
        cp -vRT "$override_dir" "${NGINX_HTML_DIR_NAME}"
    fi
}


# Check if the version already exists
if [ -f "$version_file" ]; then
    current_version=$(cat "$version_file")
    if [ "$current_version" = "${TEAMCITY_TAG}" ]; then
        cp_override_files
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
cp_override_files

# Clean up
rm -f "${TEAMCITY_BUILD_ZIP_NAME}"
# rm "${TEAMCITY_BUILD_NAME}-${TEAMCITY_TAG}.zip"
echo "${TEAMCITY_TAG}" > "$version_file"

echo
echo "Downloaded version ${TEAMCITY_TAG}"
echo
