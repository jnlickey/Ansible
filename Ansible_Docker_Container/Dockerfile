# using ubuntu LTS version
FROM ubuntu:22.04

# avoid stuck build due to user prompt
ARG DEBIAN_FRONTEND=noninteractive

ENV ANSIBLE_VERSION 2.12.3
#ENV http_proxy http://proxy.example.com:port
#ENV https_proxy http://proxy.example.com:port

WORKDIR /app
ADD . /app

# Copy proxy config if needed
#COPY 80proxy /etc/apt/apt.conf.d/80proxy

# Install needed packages
RUN set -xe \
    && apt-get update && apt-get install -y \
       openssl \
       openssh-server \
       openssh-client \
       gcc \
       python3 \
       python3-pip -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Make sudo dummy replacement, so we don't weaken docker security
RUN echo "#!/bin/bash\n\$@" > /usr/bin/sudo
RUN chmod +x /usr/bin/sudo

# Create Ansible User account
SHELL ["/bin/bash", "-c"]
RUN useradd -m -c "Ansible" -s /bin/bash -p "$(openssl passwd -1 ubuntu)" ansible; \
    chgrp -R ansible /app;

# Install ansible
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir "ansible-core==${ANSIBLE_VERSION}" \
    && pip3 install --no-cache-dir ansible
