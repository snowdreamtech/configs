#!/bin/sh
# This script is used to install the necessary packages for the project on a RHEL-based system.

major_version=$(cat /etc/redhat-release | grep -oE '[0-9]+' | head -1)

# install epel-release
# https://docs.fedoraproject.org/en-US/epel/getting-started/
sudo subscription-manager repos --enable codeready-builder-for-rhel-${major_version}-$(arch)-rpms
sudo dnf config-manager --set-enabled crb
sudo dnf -y install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-${major_version}.noarch.rpm

# update system
sudo dnf -y update

# fontconfig
sudo fc-cache -fv

# install packages
sudo dnf -y install \
    vim \
    git \
    gnupg \
    wget \
    curl \
    fastfetch \
    neovim \
    python3-neovim \
    fzf \
    ripgrep

# install lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

# install fd
wget -c https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-$(arch)-unknown-linux-gnu.tar.gz
tar xf fd-v10.2.0-$(arch)-unknown-linux-gnu.tar.gz
sudo chown -R root:root fd-v10.2.0-$(arch)-unknown-linux-gnu
cd fd-v10.2.0-$(arch)-unknown-linux-gnu
sudo cp fd /bin
gzip fd.1
sudo chown root:root fd.1.gz
sudo cp fd.1.gz /usr/share/man/man1
sudo cp autocomplete/fd.bash /usr/share/bash-completion/completions/fd
source /usr/share/bash-completion/completions/fd
cd ..
sudo rm -rfv fd-v10.2.0-$(arch)-unknown-linux-gnu 
sudo rm -rfv fd-v10.2.0-$(arch)-unknown-linux-gnu.tar.gz