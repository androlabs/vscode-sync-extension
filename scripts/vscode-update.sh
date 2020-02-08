echo '🆙 VSCODE UPDATE...configs and plugins.'

code --list-extensions | sed -e 's/^/code --install-extension /' > /home/$USER/.scripts/vscode-configs/vscode-plugins.sh

cp ~/.config/Code/User/settings.json /home/$USER/.scripts/vscode-configs/

cd /home/$USER/.scripts/vscode-configs/

git status

git fetch
git pull

git add -A
git commit -m "feat: 🚀 update plugins and settings"
git push

cd ~
echo 'Check your git 😊'!
