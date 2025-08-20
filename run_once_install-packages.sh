#!/bin/bash
# Reliable package installation with progress tracking

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Update package lists first
log_info "Updating package lists..."
sudo apt update

# Define package groups for better organization and reliability
declare -A PACKAGE_GROUPS=(
    ["essential"]="curl wget git build-essential"
    ["terminal"]="tmux vim neovim jq tree ncdu fzf"
    ["search"]="ripgrep fd-find silversearcher-ag universal-ctags"
    ["modern_cli"]="bat htop neofetch figlet"
    ["python"]="python3 python3-pip python3-venv"
    ["network"]="net-tools nmap traceroute dnsutils whois openssh-client"
    ["archive"]="zip unzip p7zip-full"
    ["system"]="rsync screen at xclip"
    ["fun"]="nyancat cowsay fortune lolcat cmatrix"
)

# Track installation status
TOTAL_GROUPS=${#PACKAGE_GROUPS[@]}
CURRENT_GROUP=0
FAILED_PACKAGES=""

# Install packages by group
for group in "${!PACKAGE_GROUPS[@]}"; do
    CURRENT_GROUP=$((CURRENT_GROUP + 1))
    log_info "[$CURRENT_GROUP/$TOTAL_GROUPS] Installing $group packages..."
    
    packages="${PACKAGE_GROUPS[$group]}"
    
    for pkg in $packages; do
        if dpkg -l | grep -q "^ii  $pkg "; then
            echo "  ✓ $pkg already installed"
        else
            echo -n "  Installing $pkg... "
            if sudo apt install -y "$pkg" >/dev/null 2>&1; then
                echo "✓"
            else
                echo "✗"
                FAILED_PACKAGES="$FAILED_PACKAGES $pkg"
                log_warn "Failed to install $pkg, continuing..."
            fi
        fi
    done
    
    log_info "Completed $group group"
    echo
done

# Install special packages that might not be in standard repos
log_info "Installing special packages..."

# Install GitHub CLI if not present
if ! command -v gh &> /dev/null; then
    log_info "Installing GitHub CLI..."
    (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
else
    log_info "GitHub CLI already installed"
fi

# Install NVM and Node.js if not present
if [ ! -d "$HOME/.nvm" ]; then
    log_info "Installing NVM and Node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm use --lts
else
    log_info "NVM already installed"
fi

# Install global npm packages if npm is available
if command -v npm &> /dev/null; then
    log_info "Installing global npm packages..."
    npm install -g @anthropic-ai/claude-code 2>/dev/null || log_warn "Failed to install claude-code"
fi

# Summary
echo
log_info "============================================"
log_info "Package installation complete!"

if [ -n "$FAILED_PACKAGES" ]; then
    log_warn "The following packages failed to install:"
    echo "$FAILED_PACKAGES" | tr ' ' '\n' | sort | uniq | sed 's/^/  - /'
    echo
    log_info "You can try installing them manually with:"
    echo "  sudo apt install$FAILED_PACKAGES"
else
    log_info "All packages installed successfully!"
fi

echo
log_info "Don't forget to source your bashrc to load aliases:"
echo "  source ~/.bashrc"