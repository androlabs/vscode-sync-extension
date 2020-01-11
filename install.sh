cd /home/$USER/
mkdir .scripts
cd .scripts

echo "Enter the github username:"
read username

echo "Enter the name repository where the configs will be stored:"
read repo

git clone https://github.com/$username/$repo
cd $repo

cd ~/.scripts/
touch vscode-update.sh

echo 'echo 'VSCODE UPDATE...configs and plugins.'' >> vscode-update.sh

echo "code --list-extensions | sed -e 's/^/code --install-extension /' > /home/$USER/.scripts/vscode-configs/vscode-plugins.sh" >> vscode-update.sh

echo "cp ~/.config/Code/User/settings.json /home/$USER/.scripts/vscode-configs/" >> vscode-update.sh

echo "cd /home/$USER/.scripts/vscode-configs/" >> vscode-update.sh

echo "git status" >> vscode-update.sh

echo "git fetch" >> vscode-update.sh
echo "git pull" >> vscode-update.sh

echo "git add -A" >> vscode-update.sh
echo "git commit -m "[UPDATE]"" >> vscode-update.sh
echo "git push" >> vscode-update.sh

echo "echo 'Check your git ;)'!" >> vscode-update.sh

chmod 777 /home/$USER/.zshrc
chmod 777 /home/$USER/.bashrc

echo $repo

sudo echo "alias vscodeupdate='cd ~/.scripts/ && ./vscode-update.sh'" >> ~/.zshrc
sudo echo "alias vscodeupdate='cd ~/.scripts/ && ./vscode-update.sh'" >> ~/.bashrc

chmod 775 ~/.scripts/vscode-update.sh

echo 'Plugin Installed...'
echo "Reload your terminal and try command 'vscodeupdate' ;)"


