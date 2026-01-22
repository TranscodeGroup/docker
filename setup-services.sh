#!/bin/bash

# One-Click Setup Script for Docker Compose Project
# Usage: ./setup-services.sh

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
GLOBAL_TIMESTAMP=$(date +%Y%m%d_%H%M%S)

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
echo -e "${GREEN}Hint: Press Enter to accept the [default] value.${NC}"
read -p "Enter installation directory [${DEFAULT_TARGET_BASE}]: " TARGET_BASE
TARGET_BASE=${TARGET_BASE:-$DEFAULT_TARGET_BASE}
TARGET_DIR="$TARGET_BASE"

echo -e "${BLUE}Installing to $TARGET_DIR...${NC}"

if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Directory $TARGET_DIR already exists.${NC}"
    read -p "Backup and overwrite? (y/N) " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Aborting."
        exit 0
    fi

    # Check if directory is not empty before backing up
    if [ "$(ls -A $TARGET_DIR)" ]; then
        BACKUP_DIR="${TARGET_DIR}_backup_${GLOBAL_TIMESTAMP}"
        
        echo -e "${YELLOW}Backing up existing directory to: $BACKUP_DIR${NC}"
        mv "$TARGET_DIR" "$BACKUP_DIR"
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}Failed to backup directory. Aborting.${NC}"
            exit 1
        fi
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
        local comment="$3"
        
        local line="$key='$val'"
        [ -n "$comment" ] && line="$line # $comment"
        
        if grep -q "^$key=" "$TARGET_ENV"; then
            # Escape | for sed delimiter
            local escaped_line=$(echo "$line" | sed 's/|/\\|/g')
            sed -i "s|^$key=.*|$escaped_line|" "$TARGET_ENV"
        else
            echo "$line" >> "$TARGET_ENV"
        fi
    }

    # Helper function to get env var (ignoring comments and quotes)
    get_env_val() {
        grep "^$1=" "$TARGET_ENV" | head -n 1 | sed 's/[[:space:]]*#.*//' | cut -d'=' -f2- | tr -d "'\"[:space:]"
    }

    # --- 4.0.1 Auto-fix SSL Path for HTTP-only scenarios ---
    # If not using HTTPS, we must ensure SSL_CERTIFICATE points to a valid file 
    # (the default placeholder) to prevent Docker Compose 'secret not found' errors.
    if [[ "$SELECTED_EXAMPLE" != *"https"* && "$SELECTED_EXAMPLE" != *"ssl"* ]]; then
        DEFAULT_CERT_PATH="$REPO_DIR/nginx/ssl/placeholder"
        CURRENT_SSL=$(get_env_val "SSL_CERTIFICATE")
        
        # If variable is empty OR the file it points to doesn't exist
        if [[ -z "$CURRENT_SSL" ]] || [[ ! -f "${CURRENT_SSL}.crt" ]]; then
             if [[ -f "${DEFAULT_CERT_PATH}.crt" ]]; then
                 echo -e "${YELLOW}HTTP mode detected: Forcing SSL_CERTIFICATE to default placeholder to ensure container startup.${NC}"
                 set_env_val "SSL_CERTIFICATE" "$DEFAULT_CERT_PATH" "Auto-set for HTTP mode"
             fi
        fi
    fi

    # --- 4.1 Configure IP/Hostname (Always prompt) ---
    echo -e "${BLUE}Server Information Configuration (Press Enter for default)${NC}"

    # Ignore template values from .env, force auto-detect
    CURRENT_IP="" 
    
    # Auto-detect IP
    DETECTED_IP=$(curl -s --max-time 3 ifconfig.me || echo "")
    
    # Always suggest the detected IP (or empty if detection failed)
    IP_DEFAULT="$DETECTED_IP"
    
    read -p "Enter Server Public IP [${IP_DEFAULT}]: " INPUT_IP
    INPUT_IP=${INPUT_IP:-$IP_DEFAULT}
    
    COMMENT_IP="User-defined"
    [ "$INPUT_IP" == "$DETECTED_IP" ] && COMMENT_IP="Auto-detected"
    
    set_env_val "SERVER_IP_PUBLIC" "$INPUT_IP" "$COMMENT_IP"

    # Ignore template values from .env
    CURRENT_HOST=""
    
    # Logic: Default to the IP address entered above 
    HOST_DEFAULT=${CURRENT_HOST:-$INPUT_IP}
    
    read -p "Enter Server Hostname (e.g., google.com) [${HOST_DEFAULT}]: " INPUT_HOST
    INPUT_HOST=${INPUT_HOST:-$HOST_DEFAULT}
    
    COMMENT_HOST="User-defined"
    [ "$INPUT_HOST" == "$INPUT_IP" ] && COMMENT_HOST="Default (Same as IP)"
    
    set_env_val "SERVER_HOSTNAME" "$INPUT_HOST" "$COMMENT_HOST"

    # --- 4.2 Generate Random Passwords ---
    generate_password() {
        openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 16
    }

    PASS_VARS=("MYSQL_PASSWORD" "REDIS_PASSWORD" "RABBITMQ_PASSWORD" "MONGODB_PASSWORD" "MINIO_PASSWORD" "MAIL_PASSWORD")
    
    echo -e "${BLUE}Checking password configurations...${NC}"
    
    # Check if data directory exists and is not empty
    DATA_DIR_VAL=$(get_env_val "DATA_DIR")
    # Default data dir if not set is /data
    CHECK_DIR="${DATA_DIR_VAL:-/data}"
    
    SHOULD_GENERATE_PASS="n"

    if [ -d "$CHECK_DIR" ] && [ "$(ls -A $CHECK_DIR 2>/dev/null)" ]; then
        echo -e "${RED}WARNING: Data directory '$CHECK_DIR' already exists and is not empty!${NC}"
        echo -e "${YELLOW}Generating new passwords while keeping old database files will cause CONNECTION ERRORS.${NC}"
        echo -e "Options:"
        echo -e "  1) Keep existing passwords (Recommended if preserving data)"
        echo -e "  2) Rename old data dir & Generate new passwords (WARNING: Hides old data)"
        echo -e "  3) Abort deployment"
        read -p "Select option [1]: " DATA_OPT
        DATA_OPT=${DATA_OPT:-1}

        case $DATA_OPT in
            1)
                echo "Keeping existing passwords."
                SHOULD_GENERATE_PASS="n"
                ;;
            2)
                # Use the SAME timestamp as the project dir backup for consistency
                BACKUP_DIR="${CHECK_DIR}_backup_${GLOBAL_TIMESTAMP}"
                echo -e "${YELLOW}Renaming $CHECK_DIR to $BACKUP_DIR...${NC}"
                mv "$CHECK_DIR" "$BACKUP_DIR"
                if [ $? -eq 0 ]; then
                    echo "Data directory renamed. Safe to generate new passwords."
                    SHOULD_GENERATE_PASS="y"
                else
                    echo -e "${RED}Failed to rename directory. Check permissions. Aborting.${NC}"
                    exit 1
                fi
                ;;
            3|*)
                echo "Aborting deployment."
                exit 0
                ;;
        esac
    else
        # Data dir empty or doesn't exist, safe to prompt for generation
        read -p "Generate new random passwords for key services? (Y/n) " GEN_PASS
        if [[ "$GEN_PASS" != "n" && "$GEN_PASS" != "N" ]]; then
            SHOULD_GENERATE_PASS="y"
        fi
    fi

    if [[ "$SHOULD_GENERATE_PASS" == "y" ]]; then
        for var in "${PASS_VARS[@]}"; do
            # Check if variable exists in the file
            if grep -q "^$var=" "$TARGET_ENV"; then
                NEW_PASS=$(generate_password)
                set_env_val "$var" "$NEW_PASS" "Auto-generated random password"
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
                     set_env_val "SSL_CERTIFICATE" "$BASE_PATH" "Auto-detected from ./ssl directory"
                     echo "SSL_CERTIFICATE updated to: $BASE_PATH"
                fi
            fi
        fi
    fi

fi

echo -e "${GREEN}Deployment setup complete!${NC}"
echo -e "Configuration file: ${YELLOW}$TARGET_ENV${NC}"

# --- SSL Certificate Checklist ---
SSL_CERT_VAL=$(get_env_val "SSL_CERTIFICATE")
# Only show checklist if SSL var is set AND the selected example implies HTTPS usage
if [[ -n "$SSL_CERT_VAL" ]] && [[ "$SELECTED_EXAMPLE" == *"https"* || "$SELECTED_EXAMPLE" == *"ssl"* ]]; then
    echo -e "\n${YELLOW}=================================================${NC}"
    echo -e "${YELLOW}           SSL CERTIFICATE CHECKLIST             ${NC}"
    echo -e "${YELLOW}=================================================${NC}"
    echo -e "The current configuration is using:"
    echo -e "CRT: ${BLUE}${SSL_CERT_VAL}.crt${NC}"
    echo -e "KEY: ${BLUE}${SSL_CERT_VAL}.key${NC}"
    echo -e ""
    echo -e "${YELLOW}ACTION REQUIRED (For Production):${NC}"
    echo -e "1. Replace placeholders with valid certificates."
    echo -e "2. Restart Nginx after replacement."
    echo -e "${YELLOW}=================================================${NC}"
fi

if [ -n "$INPUT_IP" ]; then
    echo -e "\n${GREEN}Service Access URLs:${NC}"
    echo -e "  HTTP:  ${BLUE}http://${INPUT_IP}${NC}"
    if [[ -n "$INPUT_HOST" && "$INPUT_HOST" != "$INPUT_IP" ]]; then
        echo -e "  HTTP:  ${BLUE}http://${INPUT_HOST}${NC}"
        echo -e "  HTTPS: ${BLUE}https://${INPUT_HOST}${NC}"
    fi
fi

echo -e "\nTo start services:"
echo -e "${BLUE}cd $TARGET_DIR${NC}"
echo -e "${BLUE}docker compose up -d${NC}"
echo -e "${BLUE}docker compose restart nginx${NC} (If SSL certs updated)"