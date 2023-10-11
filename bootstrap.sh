#!/bin/bash

set -e

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Set noninteractive mode
export DEBIAN_FRONTEND=noninteractive

# Update package repositories
apt-get update || { echo "Failed to update package repositories"; exit 1; }

# Install required packages
apt-get install -y --no-install-recommends \
    gcc \
    make \
    git \
    ssh \
    wget \
    curl \
    emacs \
    vim \
    python3 \
    python3-pip \
    openmpi-bin \
    openmpi-common \
    openmpi-doc \
    libopenmpi-dev \
    libperl-version-perl \
    libxml-parser-perl \
    libjson-pp-perl \
    libxml2-utils \
    jq || { echo "Failed to install required packages"; exit 1; }

# Create group and user
groupadd -r lap || { echo "Failed to create group"; exit 1; }
useradd --no-log-init -m -r -g lap lap || { echo "Failed to create user"; exit 1; }
adduser lap sudo || { echo "Failed to add user to sudoers"; exit 1; }
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers || { echo "Failed to modify sudoers file"; exit 1; }

# Switch to the lap user
su - lap -c 'cd $HOME && \
    wget -O openQCD.tar.gz http://luscher.web.cern.ch/luscher/openQCD/openQCD-2.0.tar.gz && \
    tar -xzf openQCD.tar.gz && \
    rm openQCD.tar.gz' || { echo "Failed to switch to the lap user"; exit 1; }

# Clone try-client repository
su - lap -c 'git clone https://gitlab.desy.de/ildg/hands-on/try-client.git' || { echo "Failed to clone try-client repository"; exit 1; }