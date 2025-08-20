# Dotfiles

Personal configuration files managed with [chezmoi](https://www.chezmoi.io/).

## Install

On a new machine, run:

```bash
curl -fsSL https://raw.githubusercontent.com/sayhiben/dotfiles/main/install.sh | sh
```

Or with wget:

```bash
wget -qO- https://raw.githubusercontent.com/sayhiben/dotfiles/main/install.sh | sh
```

This will:
1. Install chezmoi (if not already installed)
2. Clone this repository
3. Apply all dotfiles to your home directory

## Managing dotfiles

After installation, use chezmoi to manage your dotfiles:

```bash
# Add a new file
chezmoi add ~/.bashrc

# Edit a managed file
chezmoi edit ~/.bashrc

# See what changes would be applied
chezmoi diff

# Apply changes from the repo
chezmoi update

# Push local changes
chezmoi cd
git add .
git commit -m "Update dotfiles"
git push
```