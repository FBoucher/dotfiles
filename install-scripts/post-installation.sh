#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else

    # Logs ==============
    log_file=~/install_progress_log.txt


	echo "=== Updating and Upgrading =============="
	apt-get update && sudo apt-get upgrade -y


    echo "=== Installing Keepassx =============="
    sudo apt-get -y install keepassx


	echo "=== Installing Git =============="
	apt install git -y


    echo "=== Installing Ubuntu Restricted Extras =============="
	apt install ubunt-restricted-extras -y


    echo "=== Installing VSCode =============="
    apt-get install wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    apt install apt-transport-https
    apt update
    apt install code


    echo "=== Installing Docker =============="

    apt-get install ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io


    echo "=== Installing GitKraken  =============="
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    dpkg -i gitkraken-amd64.deb


    echo "=== Installing ZSH =============="
    apt-get -y install zsh


    echo "=== Installing OBS Studio =============="
    apt-get -y install v4l2loopback-dkms
    add-apt-repository ppa:obsproject/obs-studio
    apt update
    apt install obs-studio


    echo "=== Installing AzCLI =============="
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash


    echo "=== Installing VLC =============="
	apt install vlc -y


    echo "=== Installing Unity Tweak Tool =============="
	apt install unity-tweak-tool -y


    echo "=== Installing spotify =============="
    snap install spotify


    echo "=== Installing ncspot =============="
    snap install ncspot


    echo "=== Installing Slack =============="
    snap install slack


    echo "=== Installing OneNote Desktop =============="
    snap install onenote-desktop
    

    echo "=== Installing NanoRC =============="
    curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh


    

fi