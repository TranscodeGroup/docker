#!/bin/bash

# One-Click Deployment Script for Docker Compose Project
# Usage: ./deploy.sh

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
REPO_DIR="/home/docker"
DEFAULT_TARGET_BASE="/home/docker-compose"
DEFAULT_ENV_FILE="$REPO_DIR/default.env"

echo -e "${BLUE}=================================================${NC}"
echo -e "${BLUE}       Docker Compose One-Click Deployment       ${NC}"
echo -e "${BLUE}=================================================${NC}"

# Check if running in REPO_DIR (roughly)
if [ ! -f "default.env" ]; then
    echo -e "${YELLOW}Warning: default.env not found in current directory.${NC}"
    echo -e "Please run this script from the repository root (usually $REPO_DIR)."
    read -p "Continue anyway? (y/N) " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        exit 1
    fi
else
    REPO_DIR=$(pwd)
fi

# 1. Select Deployment Example
echo -e "${GREEN}Select a deployment scenario:${NC}"
OPTIONS=($(ls -d examples/*/ | grep -v "examples/docker" | xargs -n 1 basename))

if [ ${#OPTIONS[@]} -eq 0 ]; then
    echo -e "${RED}No examples found in examples/ directory.${NC}"
    exit 1
fi

PS3="Enter choice number: "
select OPT in "${OPTIONS[@]}"; do
    if [ -n "$OPT" ]; then
        SELECTED_EXAMPLE="$OPT"
        break
    else
        echo "Invalid selection."
    fi
done

echo -e "${GREEN}Selected: $SELECTED_EXAMPLE${NC}"

# 2. Prepare Target Directory
read -p "Enter installation directory [${DEFAULT_TARGET_BASE}]: " TARGET_BASE
TARGET_BASE=${TARGET_BASE:-$DEFAULT_TARGET_BASE}
TARGET_DIR="$TARGET_BASE"

echo -e "${BLUE}Installing to $TARGET_DIR...${NC}"

if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Directory $TARGET_DIR already exists.${NC}"
    read -p "Overwrite contents? (y/N) " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Aborting."
        exit 0
    fi
fi

mkdir -p "$TARGET_DIR"

# 3. Copy Files
echo "Copying files from examples/$SELECTED_EXAMPLE..."
cp -r "examples/$SELECTED_EXAMPLE/"* "$TARGET_DIR/"

# 4. Configure .env
echo -e "${BLUE}Configuring .env file...${NC}"
TARGET_ENV="$TARGET_DIR/.env"
EXAMPLE_ENV="examples/$SELECTED_EXAMPLE/.env"

# Start with default.env
if [ -f "default.env" ]; then
    cp "default.env" "$TARGET_ENV"
else
    echo -e "${RED}Error: default.env not found! Cannot proceed safely.${NC}"
    exit 1
fi

# Merge example .env if it exists
if [ -f "$EXAMPLE_ENV" ]; then
    echo "Applying overrides from $SELECTED_EXAMPLE/.env..."
    while IFS='=' read -r key value; do
        # Skip comments and empty lines
        [[ "$key" =~ ^#.*$ ]] && continue
        [[ -z "$key" ]] && continue
        
        # Trim whitespace
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)
        
        # If value is quoted, remove quotes (simplified)
        value="${value%\'}"
        value="${value#\'}"
        value="${value%"}"
        value="${value#"}"

        # Update key in TARGET_ENV
        if grep -q "^$key=" "$TARGET_ENV"; then
            # Escape special characters for sed
            ESCAPED_VAL=$(echo "$value" | sed 's/[\/&]/\\&/g')
            sed -i "s|^$key=.*|$key='$value'|" "$TARGET_ENV"
        fi
    done < "$EXAMPLE_ENV"
fi

# 5. Interactive Configuration
generate_password() {
    openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 16
}

echo -e "${GREEN}Checking required variables...${NC}"

# Variables to check
VARS_TO_CHECK=("SERVER_IP_PUBLIC" "SERVER_HOSTNAME")
PASS_VARS=("MYSQL_PASSWORD" "REDIS_PASSWORD" "RABBITMQ_PASSWORD" "MONGODB_PASSWORD" "MINIO_PASSWORD" "MAIL_PASSWORD")

# Helper to read env var from file
get_env_val() {
    grep "^$1=" "$TARGET_ENV" | cut -d'=' -f2- | tr -d "'\""
}

# Update env var in file
set_env_val() {
    local key="$1"
    local val="$2"
    local escaped_val=$(echo "$val" | sed 's/[\/&]/\\&/g')
    sed -i "s|^$key=.*|$key='$val'|" "$TARGET_ENV"
}

# Prompt for IP and Hostname
CURRENT_IP=$(get_env_val "SERVER_IP_PUBLIC")
if [ -z "$CURRENT_IP" ]; then
    DETECTED_IP=$(curl -s ifconfig.me || echo "")
    read -p "Enter Server Public IP [${DETECTED_IP}]: " INPUT_IP
    INPUT_IP=${INPUT_IP:-$DETECTED_IP}
    set_env_val "SERVER_IP_PUBLIC" "$INPUT_IP"
fi

CURRENT_HOST=$(get_env_val "SERVER_HOSTNAME")
if [ -z "$CURRENT_HOST" ]; then
    read -p "Enter Server Hostname (Domain) [localhost]: " INPUT_HOST
    INPUT_HOST=${INPUT_HOST:-localhost}
    set_env_val "SERVER_HOSTNAME" "$INPUT_HOST"
fi

# Handle Passwords
echo -e "${BLUE}Password Configuration${NC}"
read -p "Generate random passwords for empty/default fields? (Y/n) " GEN_PASS
if [[ "$GEN_PASS" != "n" && "$GEN_PASS" != "N" ]]; then
    for var in "${PASS_VARS[@]}"; do
        VAL=$(get_env_val "$var")
        # Generate if empty or if it looks like the user hasn't changed it (logic can be improved)
        # Here we just generate if empty or user wants to overwrite all?
        # Let's just generate if empty for safety, or we can force generate.
        # But previous copy step might have copied passwords from example.env.
        
        if [ -z "$VAL" ]; then
            NEW_PASS=$(generate_password)
            echo "Generated password for $var"
            set_env_val "$var" "$NEW_PASS"
        else
            echo "$var is already set (starts with ${VAL:0:3}...). Keeping it."
        fi
    done
fi

echo -e "${BLUE}Finalizing...${NC}"
# 6. Check SSL
SSL_VAL=$(get_env_val "SSL_CERTIFICATE")
if [[ "$SSL_VAL" == *"placeholder"* ]]; then
    if [ -d "$TARGET_DIR/ssl" ]; then
        echo -e "${YELLOW}Notice: 'ssl' directory found in $TARGET_DIR.${NC}"
        echo -e "Current SSL_CERTIFICATE is set to placeholder."
        read -p "Do you want to switch to the included certificates? (y/N) " USE_SSL
        if [[ "$USE_SSL" == "y" || "$USE_SSL" == "Y" ]]; then
            # Assuming certificate names based on example
            # standard names in example seem to vary, usually certificate.crt/key?
            # Let's check specific example
            if [ -f "$TARGET_DIR/ssl/certificate.crt" ]; then
                 set_env_val "SSL_CERTIFICATE" "$TARGET_DIR/ssl/certificate"
                 echo "Updated SSL_CERTIFICATE to $TARGET_DIR/ssl/certificate"
            else
                 echo "Could not find certificate.crt in $TARGET_DIR/ssl, skipping update."
            fi
        fi
    fi
fi

echo -e "${GREEN}Deployment setup complete!${NC}"
echo -e "Configuration file located at: ${YELLOW}$TARGET_ENV${NC}"
echo -e "To start the services, run:"
echo -e "${BLUE}cd $TARGET_DIR${NC}"
echo -e "${BLUE}docker compose up -d${NC}"
