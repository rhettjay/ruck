export WD_CONFIG_HOME="~/.config/"
./install-zsh


# Add ruck to bin
sed -i -e '$a\'$'\n''export PATH=${WD_CONFIG_HOME}/bin' ~/.zshenv
#install git
#install nvim
