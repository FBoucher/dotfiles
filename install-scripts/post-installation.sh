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


    echo "=== Installing Keepassx =============="
    apt-get -y install keepassx


	echo "=== Installing Git =============="
	apt install git -y


    echo "=== Installing Ubuntu Restricted Extras =============="
	apt install ubunt-restricted-extras -y


    echo "=== Installing VSCode =============="
    apt-get -y install wget gpg
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg

    apt install apt-transport-https
    apt update
    apt -y install code


    echo "=== Install VSCode Extensions for User frank =============="
    su frank -c "code --install-extension ms-vscode-remote.remote-container"
    su frank -c "code --install-extension  ms-azuretools.vscode-docker"
    su frank -c "code --install-extension  eamodio.gitlens"
    su frank -c "code --install-extension  ms-vscode.azurecli"
    su frank -c "code --install-extension  esbenp.prettier-vscode"
    su frank -c "code --install-extension  vscode-icons-team.vscode-icons"


    echo "=== Installing Docker =============="

    apt-get -y install ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    apt-get update
    apt-get -y install docker-ce docker-ce-cli containerd.io
    apt -y install docker.io

    usermod -aG docker $USER


    echo "=== Installing GitKraken  =============="
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
    dpkg -i gitkraken-amd64.deb


    echo "=== Installing ZSH =============="
    apt-get -y install zsh


    echo "=== Installing OBS Studio =============="
    apt-get -y install v4l2loopback-dkms
    add-apt-repository -y ppa:obsproject/obs-studio
    apt update
    apt -y install obs-studio


    echo "=== Installing AzCLI =============="
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash


    echo "=== Installing VLC =============="
	apt -y install vlc -y


    echo "=== Installing Gnome Tweak Tool =============="
	apt -y install gnome-tweaks



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
    echo "set linenumbers" >> .nanorc


    echo "=== Installing onts-powerline =============="
    apt -y install fonts-powerline    

fi