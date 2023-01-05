#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else

    # Logs ==============
    log_file=~/install_progress_log.txt


	echo "=== Updating and Upgrading =============="
	apt-get update && apt-get upgrade -y


    echo "=== Installing curl =============="
    apt-get -y install curl


    echo "=== Installing wget =============="
    apt-get -y install wget

    echo "=== Installing neovim =============="
    [ -d ~/downloads/. ] || mkdir ~/downloads 
    wget -P ~/downloads https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
    apt -y install ~/downloads/nvim-linux64.deb

    echo "=== Build Essential =============="
    apt install build-essential -y


	echo "=== Installing Git =============="
	apt install git -y


    echo "=== Installing Docker =============="

    apt-get -y install ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    apt-get update
    apt-get -y install docker-ce docker-ce-cli containerd.io
    apt -y install docker.io

    usermod -aG docker $USER


    echo "=== Installing ZSH =============="
    apt-get -y install zsh


    echo "=== Installing OBS Studio =============="
    apt-get -y install v4l2loopback-dkms
    add-apt-repository -y ppa:obsproject/obs-studio
    apt update
    apt -y install obs-studio


    echo "=== Installing AzCLI =============="
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash


    echo "=== Installing fonts-powerline =============="
    apt -y install fonts-powerline    

fi