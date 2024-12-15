
bold=$(tput bold)
BWhite='\033[1;37m'       # White
BCyan='\033[1;36m'        # Cyan

echo "Installing Waterfox"
while true; do
read -p "Do you want to install both waterfox and waterfox classic ([y]es/[n]o/[c]ancel) " ync
echo -e "${BCyan}Installing both waterfox and ${BWhite}waterfox classic"
echo -e "Only Installing ${BCyan}Waterfox"
echo "if you type c it will abort the installation"
case $ync in 
	[Yy]* ) sudo apt install waterfox waterfox-classic -y
        [Nn]*   sudo apt install waterfox -y
        [Cc]*   echo canceling the installation;
	exit;;
        * ) echo invalid response;
	    echo "do you want to finish installing waterfox";
while true; do
read -p "Do you want try again ([y]es/[n]o)" yn
case $yn in 
	[Yy]* ) curl https://raw.githubusercontent.com/gitxpresso/docker-waterfox/refs/heads/master/wfx.sh | bash  
        [Nn]*   echo Aborting
	exit;;
	
    esac
done 
