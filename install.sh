#!/bin/sh
set -e

# Install chezmoi and apply dotfiles in one go
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply sayhiben