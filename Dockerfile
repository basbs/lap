FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Berlin"

# Install required packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    sudo \
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
    libexpat1-dev \
    jq && \
    rm -rf /var/lib/apt/lists/*


# Add user
RUN groupadd -r lap && \
    useradd --no-log-init -m -r -g lap lap && \
    adduser lap sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER lap
WORKDIR /home/lap

# Download and extract openQCD
RUN wget -O openQCD.tar.gz http://luscher.web.cern.ch/luscher/openQCD/openQCD-2.0.tar.gz && \
    tar -xzf openQCD.tar.gz && \
    rm openQCD.tar.gz
# Alternatively, if you have the tarball locally, you can use:
# COPY openQCD-2.0.tar.gz .
# RUN tar -xzf openQCD-2.0.tar.gz

# Clone try-client repository
RUN git clone https://gitlab.desy.de/ildg/hands-on/try-client.git

CMD ["/bin/bash"]