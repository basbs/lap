#!/bin/sh

# Update package repositories
apk update

# Install required packages
apk add --no-cache \
    gcc \
    make \
    git \
    openssh \
    wget \
    curl \
    emacs \
    vim \
    python3 \
    py3-pip \
    openmpi \
    libxml2-utils \
    jq

/bin/sh