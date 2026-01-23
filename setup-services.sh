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
# Automatically navigate to the script's directory to ensure relative paths work
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$REPO_DIR"
echo -e "${BLUE}Working directory set to: $REPO_DIR${NC}"

DEFAULT_TARGET_BASE="$(dirname "$REPO_DIR")/docker-compose"
GLOBAL_TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo -e "${BLUE}=================================================${NC}"
echo -e "${BLUE}       Docker Compose One-Click Deployment       ${NC}"
echo -e "${BLUE}=================================================${NC}"

# 1. Select Deployment Example
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

# Parse arguments manually since we are inside the script flow
ARG_PROJECT=""

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -p|--project)
            ARG_PROJECT="$2"
            shift # past argument
            shift # past value
            ;;
        -y|--yes)
            AUTO_YES="true"
            echo -e "${YELLOW}Non-interactive mode enabled (Auto-Yes).${NC}"
            shift # past argument
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo -e "Usage: ./setup-services.sh [-p|--project <name>]"
            exit 1
            ;;
    esac
done

# Logic to select example
if [ -n "$ARG_PROJECT" ]; then
    for opt in "${OPTIONS[@]}"; do
        if [ "$opt" == "$ARG_PROJECT" ]; then
            SELECTED_EXAMPLE="$opt"
            echo -e "${GREEN}Project selected via argument: $SELECTED_EXAMPLE${NC}"
            break
        fi
    done
    if [ -z "$SELECTED_EXAMPLE" ]; then
        echo -e "${RED}Invalid project: $ARG_PROJECT${NC}"
        echo -e "Available options: ${OPTIONS[*]}"
        exit 1
    fi
else
    echo -e "${GREEN}Select a deployment project:${NC}"
    PS3="Enter choice number: "
    select OPT in "${OPTIONS[@]}"; do
        if [ -n "$OPT" ]; then
            SELECTED_EXAMPLE="$OPT"
            break
        else
            echo "Invalid selection."
        fi
    done
fi

echo -e "${GREEN}Selected: $SELECTED_EXAMPLE${NC}"

# 2. Prepare Target Directory
TARGET_DIR="$DEFAULT_TARGET_BASE"

echo -e "${BLUE}Installing to $TARGET_DIR...${NC}"

if [ -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Directory $TARGET_DIR already exists.${NC}"
    if [ "$AUTO_YES" == "true" ]; then
        confirm="y"
        echo -e "${BLUE}Auto-confirming backup and overwrite.${NC}"
    else
        read -p "Backup and overwrite? (y/N) " confirm
    fi
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
        # Only proceed if SSL_CERTIFICATE is actually defined in the template .env
        if grep -q "^SSL_CERTIFICATE=" "$TARGET_ENV"; then
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
    fi

    # --- 4.1 Configure IP/Hostname (Always prompt) ---
    echo -e "${BLUE}Server Information Configuration (Press Enter for default)${NC}"

    # Ignore template values from .env, force auto-detect
    CURRENT_IP="" 
    
    # Auto-detect IP
    DETECTED_IP=$(curl -s --max-time 3 ifconfig.me || echo "")
    
    # Always suggest the detected IP (or empty if detection failed)
    IP_DEFAULT="$DETECTED_IP"
    
    if [ "$AUTO_YES" == "true" ]; then
        INPUT_IP=$IP_DEFAULT
    else
        read -p "Enter Server Public IP [${IP_DEFAULT}]: " INPUT_IP
    fi
    INPUT_IP=${INPUT_IP:-$IP_DEFAULT}
    
    COMMENT_IP="User-defined"
    [ "$INPUT_IP" == "$DETECTED_IP" ] && COMMENT_IP="Auto-detected"
    
    set_env_val "SERVER_IP_PUBLIC" "$INPUT_IP" "$COMMENT_IP"

    # Ignore template values from .env
    CURRENT_HOST=""
    
    # Logic: Default to the IP address entered above 
    HOST_DEFAULT=${CURRENT_HOST:-$INPUT_IP}
    
    if [ "$AUTO_YES" == "true" ]; then
        INPUT_HOST=$HOST_DEFAULT
    else
        read -p "Enter Server Hostname (e.g., google.com) [${HOST_DEFAULT}]: " INPUT_HOST
    fi
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
        if [ "$AUTO_YES" == "true" ]; then
            DATA_OPT=1
            echo -e "${BLUE}Auto-selecting Option 1 (Keep existing passwords).${NC}"
        else
            read -p "Select option [1]: " DATA_OPT
        fi
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
        if [ "$AUTO_YES" == "true" ]; then
            GEN_PASS="y"
            echo -e "${BLUE}Auto-confirming password generation.${NC}"
        else
            read -p "Generate new random passwords for key services? (Y/n) " GEN_PASS
        fi
        if [[ "$GEN_PASS" != "n" && "$GEN_PASS" != "N" ]]; then
            SHOULD_GENERATE_PASS="y"
        fi
    fi

    if [[ "$SHOULD_GENERATE_PASS" == "y" ]]; then
        for var in "${PASS_VARS[@]}"; do
            # Check if variable exists in the file
            if grep -q "^$var=" "$TARGET_ENV"; then
                NEW_PASS=$(generate_password)
                set_env_val "$var" "$NEW_PASS" "Auto-generated. DO NOT CHANGE after startup or services will break."
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
            if [ "$AUTO_YES" == "true" ]; then
                UPD_SSL="y"
                echo -e "${BLUE}Auto-confirming SSL path update.${NC}"
            else
                read -p "Update SSL_CERTIFICATE path to local file? (Y/n) " UPD_SSL
            fi
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

echo -e "\n${RED}!!! IMPORTANT CONFIGURATION WARNING !!!${NC}"
echo -e "${YELLOW}Passwords have been auto-generated and synchronized.${NC}"
echo -e "${YELLOW}DO NOT change them manually in the .env file after this point.${NC}"
echo -e "${YELLOW}Changing them will break connections between services and databases.${NC}"
echo -e "${RED}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${NC}"

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

# --- 5. Install Optional Tools (FFmpeg & ifv2mp4) ---
echo -e "\n${BLUE}Optional Tools Installation (FFmpeg & ifv2mp4)${NC}"
echo -e "These tools are recommended for video processing services (e.g. jtt808)."

if [ "$AUTO_YES" == "true" ]; then
    INSTALL_TOOLS="n"
    echo -e "${YELLOW}Skipping optional tools in non-interactive mode.${NC}"
else
    read -p "Install video processing tools (FFmpeg, ifv2mp4)? (y/N) " INSTALL_TOOLS
fi

if [[ "$INSTALL_TOOLS" == "y" || "$INSTALL_TOOLS" == "Y" ]]; then
    OPT_DIR="$TARGET_DIR/opt"
    mkdir -p "$OPT_DIR"
    
    # 1. FFmpeg
    if [[ -f "$OPT_DIR/ffmpeg" && -f "$OPT_DIR/ffprobe" ]]; then
        echo -e "${GREEN}FFmpeg already exists in $OPT_DIR. Skipping download.${NC}"
    else
        echo -e "${BLUE}Installing FFmpeg...${NC}"
        curl -L -o "$OPT_DIR/ffmpeg.tar.xz" "https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz"
        
        if [ -f "$OPT_DIR/ffmpeg.tar.xz" ]; then
            echo "Extracting FFmpeg..."
            tar -xf "$OPT_DIR/ffmpeg.tar.xz" -C "$OPT_DIR"
            
            # Flatten structure: move binaries to $OPT_DIR
            FFMPEG_SUBDIR=$(find "$OPT_DIR" -maxdepth 1 -type d -name "ffmpeg-*-static" | head -n 1)
            if [ -n "$FFMPEG_SUBDIR" ]; then
                cp "$FFMPEG_SUBDIR/ffmpeg" "$FFMPEG_SUBDIR/ffprobe" "$OPT_DIR/"
                echo -e "${GREEN}FFmpeg installed to: $OPT_DIR${NC}"
            fi
            rm "$OPT_DIR/ffmpeg.tar.xz"
        else
            echo -e "${RED}Failed to download FFmpeg.${NC}"
        fi
    fi

    # 2. ifv2mp4
    IFV_DIR="$OPT_DIR/ifv2mp4"
    if [[ -f "$IFV_DIR/release/tlgrectomp4" ]]; then
        echo -e "${GREEN}ifv2mp4 already exists in $IFV_DIR. Skipping download.${NC}"
    else
        echo -e "${BLUE}Installing ifv2mp4...${NC}"
        mkdir -p "$IFV_DIR"
        curl -L -o "$IFV_DIR/tlg.tar.gz" "https://github.com/TranscodeGroup/docker/releases/download/v1.0.4/tlgrectomp4_linux1.0.0.4.tar.gz"
        
        if [ -f "$IFV_DIR/tlg.tar.gz" ]; then
            echo "Extracting ifv2mp4..."
            tar -xzf "$IFV_DIR/tlg.tar.gz" -C "$IFV_DIR"
            echo -e "${GREEN}ifv2mp4 installed to: $IFV_DIR${NC}"
        else
            echo -e "${RED}Failed to download ifv2mp4.${NC}"
        fi
    fi
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