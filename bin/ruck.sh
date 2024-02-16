#!/bin/bash

# repo_dirs=(dev sandbox learn)
# npm_pks=()
# configs=(nvim gh bat iterm tmux)
# wdg=(.zshrc .zprofile)

function install () {
	echo "Proceeding with destructive action";
	rm -rf ~/.config/* && cp -r $RUCKSACK_NVIM ~/.config;
	echo "Rucksack unpacked";
	exit;
}

export HOME_CONFIG="~/.config"
export RUCKSACK_NVIM="~/rucksack/nvim/"

echo "WARNING: this will overwrite your config"

read -p "Do you want to proceed? (yes/no) " yn

case $yn in
    yes ) install;;
    no ) echo "exiting...";
	exit;;
    * ) echo "invalid response";
	exit;;
esac

exit



# read in answer
# rm -rf ~/.zshrc && cp ./zshrc ~/.zshrc
# source ~/.zshrc

# build file structure
# if brew is setup run full otherwise evspecify
# check which things have changed local manfest


# copy nvim config
# npm install globals
# build all local dev projects under dev

