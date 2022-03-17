#!/bin/sh

# Disable SELinux
setenforce 0
sed -i 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

#
yum -y groupinstall "development tools"
yum -y install \
            bzip2-devel \
            gdbm-devel \
            libffi-devel \
            libuuid-devel \
            ncurses-devel \
            openssl-devel \
            readline-devel \
            sqlite-devel \
            tk-devel \
            wget \
            xz-devel \
            zlib-devel

# Install git
yum -y remove git
yum -y install https://packages.endpointdev.com/rhel/7/os/x86_64/endpoint-repo.x86_64.rpm
yum -y install git

# Install docker
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
gpasswd -a vagrant docker
systemctl enable docker
systemctl start docker

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
