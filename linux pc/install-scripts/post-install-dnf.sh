#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
else

    # Logs ==============
    log_file=~/install_progress_log.txt


    echo "=== Updating and Upgrading =============="
    dnf upgrade -y


    echo "=== Installing curl =============="
    dnf -y install curl


    echo "=== Installing Keepassx =============="
    dnf -y install keepassxc


    echo "=== Installing Git =============="
    dnf install git -y

    echo "=== Installing Docker =============="
    dnf -y install dnf-plugins-core
    dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

    dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    systemctl enable --now docker

    groupadd docker
    usermod -aG docker $USER


    echo "=== Installing ZSH =============="
    dnf -y install zsh

    echo "=== Installing Oh my zsh =============="
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp ../../oh-my-zsh/custom/agnoster-fb.zsh-theme ~/.oh-my-zsh/custom/


    echo "=== Installing Eza (file-listing tool) =============="
    dnf install eza -y

fi