#!/bin/bash 

bold=$(tput bold)
BWhite='\033[1;37m'       # White
BCyan='\033[1;36m'        # Cyan


echo "Installing Waterfox on Debian Based Distros"
echo "Updating All Packages"
sudo apt update
echo "Upgrading all Packages"
sudo apt upgrade
echo -e "Installing Required Packages in order for waterfox to be installed"
echo -e "install software-properties-common apt-transport-https curl"
sudo apt install software-properties-common apt-transport-https curl -y
echo "Importing GPG key and Apt repositories"
curl -fsSL https://download.opensuse.org/repositories/home:hawkeye116477:waterfox/xUbuntu_22.04/Release.key | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_hawkeye116477_waterfox.gpg > /dev/null
echo 'deb http://download.opensuse.org/repositories/home:/hawkeye116477:/waterfox/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/home:hawkeye116477:waterfox.list
echo "Updating Packages to add the new repositories added when used curl and echo"
sudo apt update
echo "Installing Waterfox"
while true; do
read -p "Do you want to install both waterfox and waterfox classic ([y]es/[n]o/[c]ancel) " yn
echo -e "${BCyan}Installing both waterfox and ${BWhite}waterfox classic"
echo -e "Only Installing ${BCyan}Waterfox"
echo "if you type c it will abort the installation"
case $ync in 
	[Yy]* ) sudo apt install waterfox waterfox-classic -y
        [Nn]*   sudo apt install waterfox -y
        [Cc]*   echo canceling the installation;
	exit;;
        * ) echo invalid response;
	curl https://raw.githubusercontent.com/gitxpresso/docker-waterfox/refs/heads/master/wfox.sh | bash;;

  
    esac
done 
