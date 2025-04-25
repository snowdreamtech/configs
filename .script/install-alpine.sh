#!/bin/sh
# This script is used to install the necessary packages for the project on a Alpine-based system.

# update system
apk update --no-cache

# install packages
apk add --no-cache \
    vim \
    git \
    gnupg \
    wget \
    curl \
    fastfetch
