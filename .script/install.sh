#!/bin/sh
# This script is used to install the necessary packages for the project.

# Detect the operating system
if [ "$(uname)" = "Darwin" ]; then
    echo "This system is macOS."
    . ./install-macos.sh
elif [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
    alpine)
        echo "This system is Alpine."
        . ./install-alpine.sh
        ;;
    ubuntu)
        echo "This system is Ubuntu."
        . ./install-debian.sh
        ;;
    debian)
        echo "This system is Debian."
        . ./install-debian.sh
        ;;
    rhel)
        echo "This system is RHEL."
        . ./install-rhel.sh
        ;;
    centos)
        echo "This system is CentOS."
        . ./install-rhel.sh
        ;;
    *)
        echo "This system is $ID."
        ;;
    esac
else
    echo "Unknown operating system."
fi
