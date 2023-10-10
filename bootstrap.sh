#!/bin/bash
# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Set noninteractive mode
export DEBIAN_FRONTEND=noninteractive
# Update package repositories
apt-get update
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
    jq
wget -O - http://luscher.web.cern.ch/luscher/openQCD/openQCD-2.0.tar.gz | tar -xf -
git clone https://gitlab.desy.de/ildg/hands-on/try-client.git