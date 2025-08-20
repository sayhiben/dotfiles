#!/bin/bash
# Create standard directory structure

echo "Setting up directory structure..."

# Development directories
mkdir -p ~/dev
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/bin
mkdir -p ~/.local/bin

# Document directories
mkdir -p ~/Documents/notes
mkdir -p ~/Documents/configs
mkdir -p ~/Documents/references

# Media directories
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Downloads/temp

# Config directories
mkdir -p ~/.config
mkdir -p ~/.ssh/sockets
chmod 700 ~/.ssh
chmod 700 ~/.ssh/sockets

# Tmux plugin directory
mkdir -p ~/.tmux/plugins

# Vim/Neovim directories
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
mkdir -p ~/.config/nvim

# Create .gitignore_global
cat > ~/.gitignore_global << 'EOF'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
*~
*.swp
*.swo

# IDE files
.vscode/
.idea/
*.iml
.project
.classpath
.settings/

# Dependencies
node_modules/
vendor/
venv/
env/
*.egg-info/
__pycache__/
*.pyc

# Build outputs
dist/
build/
target/
out/
*.o
*.so
*.exe
*.dll

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Environment files
.env
.env.local
.env.*.local

# Temporary files
tmp/
temp/
*.tmp
*.bak
*.backup
EOF

echo "Directory structure created successfully!"