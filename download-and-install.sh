#!/bin/bash

# ==========================================
# TranscodeGroup One-Click Installer
# Downloads repo, installs deps, runs setup
# Usage: 
# curl -fsSL https://raw.githubusercontent.com/.../download-and-install.sh | bash
# curl -fsSL https://raw.githubusercontent.com/TranscodeGroup/docker/perf/deploy/nxr/download-and-install.sh | sudo BRANCH=perf/deploy/nxr bash
# ==========================================

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
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
        
        # Auto-detect branch if user didn't specify one
        if [ "$BRANCH" == "master" ]; then
            DETECTED_LOCAL_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "master")
            if [ "$DETECTED_LOCAL_BRANCH" != "HEAD" ]; then
                BRANCH=$DETECTED_LOCAL_BRANCH
                echo -e "${BLUE}Auto-detected current branch: $BRANCH${NC}"
            fi
        fi

        # Prompt for confirmation BEFORE any git operations
        echo -e "${YELLOW}Existing repository detected at $INSTALL_DIR.${NC}"
        echo -e "${YELLOW}Would you like to fetch and reset to latest origin/$BRANCH? (y/N)${NC}"
        read -p "> " confirm < /dev/tty
        
        if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
            echo -e "${BLUE}Updating repository...${NC}"
            git fetch origin
            git reset --hard "origin/$BRANCH"
            git clean -fd
            echo -e "${GREEN}Successfully updated and cleaned worktree.${NC}"
        else
            echo -e "${BLUE}Skipping update. Using existing local code.${NC}"
        fi
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
check_docker_status() {
    if systemctl is-active --quiet docker; then
        return 0
    else
        echo -e "${BLUE}Starting Docker service...${NC}"
        systemctl start docker
        if systemctl is-active --quiet docker; then
            return 0
        fi
    fi
    return 1
}

if ! command -v docker &> /dev/null; then
    echo -e "${BLUE}Docker not found. Installing via official script...${NC}"
    curl -fsSL https://get.docker.com | bash
    systemctl enable docker
    
    if check_docker_status; then
        echo -e "${GREEN}Docker installed and started successfully.${NC}"
    else
        echo -e "${RED}Error: Docker installed but failed to start.${NC}"
        echo -e "${YELLOW}Please check logs: journalctl -xeu docker.service${NC}"
        echo -e "${YELLOW}You may need to install Docker manually.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}Docker detected.${NC}"
    if ! check_docker_status; then
        echo -e "${RED}Error: Docker is installed but not running and failed to start.${NC}"
        echo -e "${YELLOW}Please check logs: journalctl -xeu docker.service${NC}"
        exit 1
    fi
fi

# 5. Handover to setup-services.sh
DEPLOY_SCRIPT="$INSTALL_DIR/setup-services.sh"

if [ -f "$DEPLOY_SCRIPT" ]; then
    chmod +x "$DEPLOY_SCRIPT"
    echo -e "${BLUE}>>> Handing over to setup-services.sh...${NC}"
    echo ""
    # Switch to directory before execution to ensure relative paths work
    cd "$INSTALL_DIR"
    # Ensure stdin is attached to terminal for interactive input
    exec ./setup-services.sh < /dev/tty
else
    echo -e "${RED}Critical Error: setup-services.sh not found in downloaded repository!${NC}"
    exit 1
fi
