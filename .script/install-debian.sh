#!/bin/sh
# This script is used to install the necessary packages for the project on a Debian-based system.

# update system
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update

# fontconfig
sudo fc-cache -fv

# install packages
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
    vim \
    git \
    gnupg \
    wget \
    curl \
    fastfetch \
    neovim \
    lazygit \
    fzf \
    ripgrep \
    fd-find
