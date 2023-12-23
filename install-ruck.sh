[ ! -f install_config ] && cp install_config .config

source ~/.zshenv
source ~/.zshrc
source ~/.zprofile

. "$WD_CONFIG_HOME/install-zsh"

#install git
#install nvim
