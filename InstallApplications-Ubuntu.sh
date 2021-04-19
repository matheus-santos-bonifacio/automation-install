#!/bin/bash

## remove the lock apt
rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

## Update repository
apt-get update

apt-get remove docker docker-engine docker.io containerd runc

apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	zsh \
	dconf-cli \
	git \
	snapd \
	deluge \
	lmms \
	timeshift \
	dirmngr \
	gpg \
	unzip

snap install blender --classic
snap install code --classic
snap install heroku --classic
snap install arduino
snap install beekeeper-studio
snap install chromium
snap install insomnia
snap install mysql-workbench-community
snap install skype
snap install zoom-client
snap install audacity
snap install vlc

## make zsh default shell
chsh -s $(which zsh)

## Adding repositorys
## Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

apt-get update

## Install applications
## Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0

## Outhers
apt-get install docker-ce docker-ce-cli containerd.io \
	google-chrome-stable

## Configuring applications
## asdf - nodejs - yarn
asdf plugin-add \
	nodejs \
	yarn \
	https://github.com/jthegedus/asdf-firebase.git \
	asdf plugin-add rust https://github.com/code-lever/asdf-rust.git \
	asdf plugin-add python \
	dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git \
	docker-slim https://github.com/everpeace/asdf-docker-slim.git \
	elixir https://github.com/asdf-vm/asdf-elixir.git

bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-previous-release-team-keyring'

## Workbench
snap connect mysql-workbench-community:password-manager-service
snap connect mysql-workbench-community:ssh-keys
snap connect mysql-workbench-community:cups-control

## Dracula theme
cd /tmp
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

## asdf
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc

echo "Finish instalation"
