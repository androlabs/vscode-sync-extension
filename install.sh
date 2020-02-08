#!/bin/bash

path_download=$(pwd)

cd /home/$USER/
mkdir .scripts
cd .scripts

echo -n "👥 Enter the github username: "
read username

echo -n "📦 Enter the name repository where the configs will be stored: "
read repo


PS3='Enter clone mode: '
options=("SSH" "HTTPS")
select opt in "${options[@]}"
do
    case $opt in
        "SSH")
            echo "You chose mode SSH"
            git clone git@github.com:$username/$repo.git
            
            break
            ;;
        "HTTPS")
            echo "You chose mode HTTPS"
            git clone https://github.com/$username/$repo
            
            break
            ;;
        
        *) echo "invalid option $REPLY";;
    esac
done

cd $path_download/scripts/
cp vscode-update.sh ~/.scripts


chmod 777 /home/$USER/.zshrc
chmod 777 /home/$USER/.bashrc

echo $repo

sudo echo "alias vscodeupdate='cd ~/.scripts/ && ./vscode-update.sh'" >> ~/.zshrc
sudo echo "alias vscodeupdate='cd ~/.scripts/ && ./vscode-update.sh'" >> ~/.bashrc

chmod 775 ~/.scripts/vscode-update.sh

echo 'Plugin Installed... 🚀'
echo "Reload your terminal and try command 'vscodeupdate' 😊"

