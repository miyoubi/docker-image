#!/usr/bin/env bash
# Installation of all packages from CachyOS repos
set -e

# Get an archive containing the script for adding repo.
wget "https://mirror.cachyos.org/cachyos-repo.tar.xz"
tar -xf "cachyos-repo.tar.xz"
cd cachyos-repo
sed -i 's|pacman -U|pacman -U  --noconfirm|' cachyos-repo.sh
bash cachyos-repo.sh
cd ..
rm -rf cachyos-repo

# Update
pacman -Syyu --noconfirm 2>&1 | grep -v "warning: could not get file information"

echo 'CachyOS packages installtion completed'
