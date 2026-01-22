#!/bin/bash

# ==========================================
# TranscodeGroup One-Click Installer
# Downloads repo, installs deps, runs setup
# Usage: curl -fsSL https://raw.githubusercontent.com/.../download-and-install.sh | bash
# ==========================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

REPO_URL="https://github.com/TranscodeGroup/docker.git"
INSTALL_DIR="/home/docker"
# Allow overriding branch via env var, default to 'master'
BRANCH=${BRANCH:-"master"}

echo -e "${BLUE}>>> Starting TranscodeGroup Installer...${NC}"

# 1. Root Check
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Please run as root (sudo su).${NC}"
  exit 1
fi

# 2. System Dependencies (Git)
if ! command -v git &> /dev/null; then
    echo -e "${BLUE}Installing Git...${NC}"
    if [ -f /etc/redhat-release ]; then
        yum install -y git
    elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
        apt-get update && apt-get install -y git
    else
        echo -e "${RED}Unsupported OS for auto-install. Please install git manually.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}Git detected.${NC}"
fi

# 3. Clone Repository or Update
if [ -d "$INSTALL_DIR" ]; then
    if [ -d "$INSTALL_DIR/.git" ]; then
        echo -e "${BLUE}Updating existing repository at $INSTALL_DIR...${NC}"
        cd "$INSTALL_DIR"
        git fetch origin
        git reset --hard "origin/$BRANCH"
    else
        # Directory exists but is NOT a git repo (e.g. manual mkdir or unzip)
        if [ "$(ls -A $INSTALL_DIR)" ]; then
             BACKUP_DIR="${INSTALL_DIR}_backup_$(date +%s)"
             echo -e "${YELLOW}Directory $INSTALL_DIR exists but is not a git repo.${NC}"
             echo -e "${YELLOW}Renaming to $BACKUP_DIR to allow fresh install...${NC}"
             mv "$INSTALL_DIR" "$BACKUP_DIR"
             
             echo -e "${BLUE}Cloning repository to $INSTALL_DIR...${NC}"
             git clone -b "$BRANCH" "$REPO_URL" "$INSTALL_DIR"
        else
             # Directory exists but is empty
             echo -e "${BLUE}Cloning repository to existing empty directory $INSTALL_DIR...${NC}"
             git clone -b "$BRANCH" "$REPO_URL" "$INSTALL_DIR"
        fi
    fi
else
    echo -e "${BLUE}Cloning repository to $INSTALL_DIR...${NC}"
    mkdir -p "$(dirname "$INSTALL_DIR")"
    git clone -b "$BRANCH" "$REPO_URL" "$INSTALL_DIR"
fi

# 4. Docker Check & Install
if ! command -v docker &> /dev/null; then
    echo -e "${BLUE}Docker not found. Installing via official script...${NC}"
    curl -fsSL https://get.docker.com | bash
    systemctl enable docker
    systemctl start docker
    echo -e "${GREEN}Docker installed.${NC}"
else
    echo -e "${GREEN}Docker detected.${NC}"
fi

# 5. Handover to setup-services.sh
DEPLOY_SCRIPT="$INSTALL_DIR/setup-services.sh"

if [ -f "$DEPLOY_SCRIPT" ]; then
    chmod +x "$DEPLOY_SCRIPT"
    echo -e "${BLUE}>>> Handing over to setup-services.sh...${NC}"
    echo ""
    # Switch to directory before execution to ensure relative paths work
    cd "$INSTALL_DIR"
    exec ./setup-services.sh
else
    echo -e "${RED}Critical Error: setup-services.sh not found in downloaded repository!${NC}"
    exit 1
fi
