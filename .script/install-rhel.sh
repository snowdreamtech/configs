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

# install packages
sudo dnf -y install \
    vim \
    git \
    gnupg \
    wget \
    curl \
    fastfetch
