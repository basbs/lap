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
    sudo \
    make \
    git \
    ssh \
    wget \
    curl \
    vim \
    openmpi-bin \
    openmpi-common \
    openmpi-doc \
    libopenmpi-dev || { echo "Failed to install required packages"; exit 1; }

# Create group and user
groupadd -r lap || { echo "Failed to create group"; exit 1; }
useradd --no-log-init -m -r -g lap lap || { echo "Failed to create user"; exit 1; }
adduser lap sudo || { echo "Failed to add user to sudoers"; exit 1; }
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers || { echo "Failed to modify sudoers file"; exit 1; }
chsh -s /bin/bash lap

# Switch to the lap user
# su - lap

# Exit (then re-connect with `docker exec -u lap -it lap /bin/bash`)
exit
