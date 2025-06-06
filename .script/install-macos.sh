#!/bin/sh
# This script is used to install the necessary packages for the project on a MacOS-based system.

# fontconfig
cp -rfv ../.fonts/* ~/Library/Fonts

# install packages
brew install \
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
    fd
