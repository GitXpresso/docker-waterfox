echo "Installing Waterfox"
while true; do
read -p "Do you want to install both waterfox and waterfox classic (y/n) " yn
echo  "${BCyan}Installing both waterfox and ${BWhite}waterfox classic"
echo "Only Installing ${BCyan}Waterfox";;
echo "if you type c it will abort the installation"
case $ync in 
	[Yy]* ) sudo apt install waterfox waterfox-classic -y
        [Nn]* ) sudo apt install waterfox -y
        [Cc]* ) exit;;	

  
    esac
done 
