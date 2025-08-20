# 🚀 Personal Dotfiles

A comprehensive, portable development environment managed with [chezmoi](https://www.chezmoi.io/). Optimized for both general Linux systems and Raspberry Pi devices.

## ✨ Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/sayhiben/dotfiles/main/install.sh | sh
```

Or with wget:
```bash
wget -qO- https://raw.githubusercontent.com/sayhiben/dotfiles/main/install.sh | sh
```

This single command will:
1. Install chezmoi
2. Clone this repository
3. Apply all configurations
4. Install 50+ useful packages
5. Set up development environment

## 📦 What's Included

### 🖥️ Terminal Environment

#### **Bash Configuration** (`~/.bashrc`, `~/.bash_aliases`)
- **100+ aliases** for common tasks
- **Smart prompt** with colors and git branch info
- **Environment variables** for development
- **Path additions** for local binaries
- **NVM integration** for Node.js management
- **FZF integration** for fuzzy finding

<details>
<summary><b>Key Aliases</b></summary>

```bash
# Navigation
ll      # Detailed list with hidden files
la      # List all including hidden
..      # Go up one directory
...     # Go up two directories

# Git shortcuts
gs      # git status
ga      # git add
gc      # git commit
gp      # git push
gl      # git log --oneline --graph
gd      # git diff

# System
update  # Update system packages
myip    # Show public IP
temp    # Show CPU temperature (RPi)
weather # Show weather forecast

# Development
py      # python3
venv    # Create virtual environment
json    # Pretty print JSON
```
</details>

### 🎨 Neovim Configuration (`~/.config/nvim/`)

Modern Neovim setup with LSP, Treesitter, and powerful plugins.

<details>
<summary><b>Features & Keybindings</b></summary>

#### **Core Features**
- **LSP Support** - Intelligent code completion, go-to-definition, refactoring
- **Treesitter** - Advanced syntax highlighting and code understanding
- **Telescope** - Fuzzy finder for files, text, and more
- **Auto-ctags** - Automatic tag generation for code navigation
- **Git integration** - See changes, blame, and commit history

#### **Key Mappings**
Leader key: `,`

```vim
" File Navigation
<leader>ff  - Find files
<leader>fg  - Live grep (search in files)
<leader>fb  - Browse buffers
<leader>fr  - Recent files
<leader>e   - File explorer

" LSP Actions
gd          - Go to definition
gr          - Find references
K           - Show hover documentation
<leader>rn  - Rename symbol
<leader>ca  - Code actions
[d / ]d     - Previous/next diagnostic

" Window Management
Ctrl+h/j/k/l - Navigate windows
Shift+h/l    - Previous/next buffer

" Git
<leader>gc  - Browse commits
<leader>gs  - Git status

" Terminal
Ctrl+\      - Toggle floating terminal

" Editing
gcc         - Comment/uncomment line
<leader>w   - Save file
<leader>q   - Quit
```

#### **Supported Languages**
Automatic LSP setup for:
- Python (pyright)
- JavaScript/TypeScript (tsserver)
- Go (gopls)
- Rust (rust_analyzer)
- Bash (bashls)
- Docker (dockerls)
- HTML/CSS
- JSON/YAML
- Markdown
</details>

### 🛠️ Vim Configuration (`~/.vimrc`)

Classic Vim setup for lightweight editing with sensible defaults.

<details>
<summary><b>Features</b></summary>

- Line numbers and relative numbers
- Syntax highlighting
- Smart indentation
- Search highlighting
- File explorer with `<leader>e`
- Window navigation with `Ctrl+h/j/k/l`
- No swap files (uses persistent undo instead)
</details>

### 🖼️ Tmux Configuration (`~/.tmux.conf`)

Powerful terminal multiplexer setup.

<details>
<summary><b>Key Bindings</b></summary>

Prefix: `Ctrl+a`

```bash
# Sessions
Ctrl+a s    - List sessions
Ctrl+a $    - Rename session

# Windows
Ctrl+a c    - New window
Ctrl+a ,    - Rename window
Ctrl+a 1-9  - Switch to window
Ctrl+h/l    - Previous/next window

# Panes
Ctrl+a |    - Split vertical
Ctrl+a -    - Split horizontal
Ctrl+a h/j/k/l - Navigate panes
Ctrl+a H/J/K/L - Resize panes

# Other
Ctrl+a r    - Reload config
Ctrl+a s    - Synchronize panes (type in all)
```

Features:
- Mouse support enabled
- Persistent sessions with tmux-resurrect
- Beautiful status bar
- Vi-mode for copy/paste
</details>

### 🔧 Git Configuration (`~/.gitconfig`)

Extensive git aliases and smart defaults.

<details>
<summary><b>Git Aliases</b></summary>

```bash
# Quick commands
git s       # Short status
git a       # Add files
git cm      # Commit with message
git p       # Push
git pl      # Pull
git co      # Checkout
git cob     # Checkout new branch

# Advanced
git lg      # Beautiful log graph
git undo    # Undo last commit (keep changes)
git amend   # Amend last commit
git unstage # Unstage files

# Stash
git ss      # Stash save
git sp      # Stash pop
git sl      # Stash list
```

Features:
- GitHub CLI integration
- Smart diff and merge tools
- Auto-prune on fetch
- GPG signing ready
</details>

### 🔐 SSH Configuration (`~/.ssh/config`)

Secure SSH setup with best practices.

- Connection multiplexing for faster connections
- Keep-alive settings
- Modern cipher preferences
- Per-host configurations
- GitHub/GitLab shortcuts

### 📦 Package Management

#### **Auto-installed packages** (50+)

<details>
<summary><b>Full Package List</b></summary>

**Terminal Tools:**
- `jq` - JSON processor
- `fzf` - Fuzzy finder
- `ripgrep` - Fast grep alternative
- `bat` - Better cat with syntax highlighting
- `exa` - Modern ls replacement
- `tmux` - Terminal multiplexer
- `htop` - Interactive process viewer
- `tree` - Directory tree viewer
- `ncdu` - Disk usage analyzer
- `ranger` - Terminal file manager

**Development:**
- `git`, `vim`, `neovim`
- `python3`, `nodejs`, `npm`
- `golang`, `rust`, `cargo`
- `universal-ctags`
- `build-essential`

**Network Tools:**
- `nmap` - Network scanner
- `traceroute` - Network diagnostic
- `dnsutils` - DNS tools
- `whois` - Domain lookup
- `openssh-server`

**Fun:**
- `nyancat` - Rainbow cat animation
- `cowsay` - Talking cow
- `lolcat` - Rainbow text
- `cmatrix` - Matrix animation
- `figlet` - ASCII art text
</details>

## 🎯 Device-Specific Features

### Raspberry Pi Zero 2 W ("termyte")

Configurations that only apply on the specific Raspberry Pi device:

<details>
<summary><b>Pi-Specific Settings</b></summary>

- **HyperPixel Display** - 480x800 @ 90° rotation
- **Boot Config** - GPU memory, screen tearing fixes
- **CircuitPy Mount** - Auto-mount at `/media/circuitpy`
- **Kanshi** - Display management for vertical screen
- **Labwc** - Wayland compositor configuration

These settings are automatically detected and only applied on hostname "termyte".
</details>

## 🚀 Usage

### Daily Workflow

```bash
# Update dotfiles from repo
chezmoi update

# Edit and apply dotfiles
chezmoi edit ~/.bashrc
chezmoi apply

# Add new dotfile
chezmoi add ~/.config/newapp/config

# Push changes
chezmoi cd
git add .
git commit -m "Update configs"
git push
```

### First-time Setup

After installation, you might want to:

1. **Generate SSH keys:**
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

2. **Configure Git:**
   ```bash
   git config --global user.email "your_email@example.com"
   git config --global user.name "Your Name"
   ```

3. **Authenticate GitHub CLI:**
   ```bash
   gh auth login
   ```

4. **Set up Node.js:**
   ```bash
   nvm install --lts
   nvm use --lts
   ```

## 📁 Directory Structure

The setup creates these directories:

```
~/
├── dev/              # Development projects
├── projects/         # Personal projects
├── scripts/          # Custom scripts
├── bin/              # User binaries
├── .local/bin/       # Local binaries
├── Documents/
│   ├── notes/        # Personal notes
│   ├── configs/      # Config backups
│   └── references/   # Reference materials
└── .config/          # Application configs
```

## 🔄 Maintenance

### Update All Packages

```bash
# System packages
update  # (alias for apt update && upgrade)

# Neovim plugins
nvim +Lazy sync +qa

# Tmux plugins
# Press Ctrl+a, I in tmux
```

### Backup Current State

```bash
chezmoi re-add
chezmoi cd
git add .
git commit -m "Backup current state"
git push
```

## 🤝 Contributing

Feel free to fork and customize for your own use! Some ideas:

- Add your own aliases in `~/.bash_aliases`
- Customize Neovim plugins in `~/.config/nvim/init.lua`
- Add device-specific configs using chezmoi templates
- Include your favorite tools in the package list

## 📝 License

MIT - Use this however you'd like!

## 🙏 Acknowledgments

- [chezmoi](https://www.chezmoi.io/) - Dotfile management
- [Neovim](https://neovim.io/) - Text editor
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- All the amazing open-source tool authors

---

**Note:** This is a living configuration that evolves with my workflow. Regular updates are pushed to improve the development experience.