#!/bin/bash
# Install common packages

# Update package list
sudo apt update

# List of packages to install
PACKAGES=(
    # Essential tools
    "curl"
    "wget"
    "git"
    "build-essential"
    "software-properties-common"
    
    # Terminal tools
    "htop"
    "tmux"
    "vim"
    "neovim"
    "jq"
    "tree"
    "ncdu"
    "ranger"
    "fzf"
    "ripgrep"
    "fd-find"
    "bat"
    "exa"
    "tldr"
    "neofetch"
    "figlet"
    
    # Development
    "python3"
    "python3-pip"
    "python3-venv"
    "nodejs"
    "npm"
    "golang"
    "rustc"
    "cargo"
    
    # Network tools
    "net-tools"
    "nmap"
    "traceroute"
    "dnsutils"
    "whois"
    "openssh-client"
    "openssh-server"
    
    # Archive tools
    "zip"
    "unzip"
    "p7zip-full"
    "rar"
    "unrar"
    
    # System tools
    "rsync"
    "screen"
    "at"
    "cron"
    "xclip"
    
    # Fun
    "nyancat"
    "cowsay"
    "fortune"
    "lolcat"
    "cmatrix"
    
    # Libraries (for various tools)
    "libsdl2-dev"
    "libssl-dev"
    "libffi-dev"
)

# Install packages if not already installed
for pkg in "${PACKAGES[@]}"; do
    if ! dpkg -l | grep -q "^ii  $pkg "; then
        echo "Installing $pkg..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed"
    fi
done

# Install GitHub CLI if not present
if ! command -v gh &> /dev/null; then
    echo "Installing GitHub CLI..."
    (type -p wget >/dev/null || (sudo apt update && sudo apt install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
fi

# Install NVM if not present
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install 22
fi

# Install global npm packages
if command -v npm &> /dev/null; then
    echo "Installing global npm packages..."
    npm install -g @anthropic-ai/claude-code
fi

echo "Package installation complete!"