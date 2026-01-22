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

echo -e "${BLUE}=================================================${NC}"
echo -e "${BLUE}       Docker Compose One-Click Deployment       ${NC}"
echo -e "${BLUE}=================================================${NC}"

# 1. Select Deployment Example
echo -e "${GREEN}Select a deployment scenario:${NC}"
# List directories in examples/ excluding 'docker'
if [ -d "examples" ]; then
    OPTIONS=($(ls -d examples/*/ | grep -v "examples/docker/" | xargs -n 1 basename))
else
    echo -e "${RED}Error: 'examples' directory not found. Please run inside the project root.${NC}"
    exit 1
fi

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

# 3. Copy Files (Directly from the selected example)
echo "Copying files from examples/$SELECTED_EXAMPLE..."
# Use /. to include hidden files (like .env)
cp -r "examples/$SELECTED_EXAMPLE/." "$TARGET_DIR/"

# 4. Configure .env
TARGET_ENV="$TARGET_DIR/.env"

if [ ! -f "$TARGET_ENV" ]; then
    echo -e "${YELLOW}Warning: No .env file found in examples/$SELECTED_EXAMPLE.${NC}"
    echo "You may need to manually configure the environment."
else
    echo -e "${BLUE}Configuring .env file...${NC}"

    # Helper function to update or append env var
    set_env_val() {
        local key="$1"
        local val="$2"
        # Escape slashes for sed
        local escaped_val=$(echo "$val" | sed 's/[\/&]/\\&/g')
        
        if grep -q "^$key=" "$TARGET_ENV"; then
            sed -i "s|^$key=.*|$key='$val'|" "$TARGET_ENV"
        else
            echo "$key='$val'" >> "$TARGET_ENV"
        fi
    }

    # Helper function to get env var (ignoring comments and quotes)
    get_env_val() {
        grep "^$1=" "$TARGET_ENV" | head -n 1 | sed 's/[[:space:]]*#.*//' | cut -d'=' -f2- | tr -d "'\"[:space:]"
    }

    # --- 4.1 Configure IP/Hostname (Always prompt) ---
    echo -e "${BLUE}Server Information Configuration${NC}"

    # Get current IP from .env
    CURRENT_IP=$(get_env_val "SERVER_IP_PUBLIC")
    
    # Auto-detect IP
    DETECTED_IP=$(curl -s --max-time 3 ifconfig.me || echo "")
    
    # Logic: If CURRENT_IP is empty or equals the known placeholder example, force use of DETECTED_IP
    if [[ -z "$CURRENT_IP" || "$CURRENT_IP" == "200.155.137.26" ]]; then
        IP_DEFAULT="$DETECTED_IP"
    else
        IP_DEFAULT="$CURRENT_IP"
    fi
    
    read -p "Enter Server Public IP [${IP_DEFAULT}]: " INPUT_IP
    INPUT_IP=${INPUT_IP:-$IP_DEFAULT}
    set_env_val "SERVER_IP_PUBLIC" "$INPUT_IP"

    # Get current Hostname from .env
    CURRENT_HOST=$(get_env_val "SERVER_HOSTNAME")
    
    # Logic: If empty, default to the IP address entered above 
    HOST_DEFAULT=${CURRENT_HOST:-$INPUT_IP}
    
    read -p "Enter Server Hostname (Domain) [${HOST_DEFAULT}]: " INPUT_HOST
    INPUT_HOST=${INPUT_HOST:-$HOST_DEFAULT}
    set_env_val "SERVER_HOSTNAME" "$INPUT_HOST"

    # --- 4.2 Generate Random Passwords ---
    generate_password() {
        openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 16
    }

    PASS_VARS=("MYSQL_PASSWORD" "REDIS_PASSWORD" "RABBITMQ_PASSWORD" "MONGODB_PASSWORD" "MINIO_PASSWORD" "MAIL_PASSWORD")
    
    echo -e "${BLUE}Checking password configurations...${NC}"
    read -p "Generate new random passwords for key services? (Y/n) " GEN_PASS
    if [[ "$GEN_PASS" != "n" && "$GEN_PASS" != "N" ]]; then
        for var in "${PASS_VARS[@]}"; do
            # Check if variable exists in the file
            if grep -q "^$var=" "$TARGET_ENV"; then
                NEW_PASS=$(generate_password)
                set_env_val "$var" "$NEW_PASS"
                echo "Updated $var with new random password."
            fi
        done
    fi

    # --- 4.3 SSL Certificate Path Correction ---
    # If the user selected an example with an 'ssl' folder, update the path
    if [ -d "$TARGET_DIR/ssl" ]; then
        SSL_VAL=$(get_env_val "SSL_CERTIFICATE")
        # Heuristic: if ssl folder exists, and current config is placeholder or empty, prompt to update
        if [[ "$SSL_VAL" == *"placeholder"* ]] || [ -z "$SSL_VAL" ]; then
            echo -e "${YELLOW}Local SSL certificates detected in ./ssl directory.${NC}"
            read -p "Update SSL_CERTIFICATE path to local file? (Y/n) " UPD_SSL
            if [[ "$UPD_SSL" != "n" && "$UPD_SSL" != "N" ]]; then
                # Find the crt file
                CRT_FILE=$(find "$TARGET_DIR/ssl" -name "*.crt" | head -n 1)
                if [ -n "$CRT_FILE" ]; then
                     # Remove extension for the config
                     BASE_PATH="${CRT_FILE%.*}"
                     # Use absolute path
                     set_env_val "SSL_CERTIFICATE" "$BASE_PATH"
                     echo "SSL_CERTIFICATE updated to: $BASE_PATH"
                fi
            fi
        fi
    fi

fi

echo -e "${GREEN}Deployment setup complete!${NC}"
echo -e "Configuration file: ${YELLOW}$TARGET_ENV${NC}"
echo -e "To start services:"
echo -e "${BLUE}cd $TARGET_DIR${NC}"
echo -e "${BLUE}docker compose up -d${NC}"

if [ -n "$INPUT_IP" ]; then
    echo -e "\n${GREEN}Service Access URLs:${NC}"
    echo -e "  HTTP:  ${BLUE}http://${INPUT_IP}${NC}"
    if [[ -n "$INPUT_HOST" && "$INPUT_HOST" != "$INPUT_IP" ]]; then
        echo -e "  HTTP:  ${BLUE}http://${INPUT_HOST}${NC}"
        echo -e "  HTTPS: ${BLUE}https://${INPUT_HOST}${NC} (Requires SSL config)"
    fi
fi