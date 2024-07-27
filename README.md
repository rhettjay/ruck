# dotconfig
The OGs of the software development community called it a `dotconfig`, I call it my rucksack.
As defined here, it is a digital backpack; my opinionated setup for migrating to new lands of hardware without losing sane context.
Feel free to browse through and use pieces as you see fit.

## configs
- [Neovim Configuration](./.config/nvim)
- [Zsh Configuration](./.zshrc)
- [CLI Utilities](./Brewfile)

## How to use it
```bash
# Clone the repo
git clone https://github.com/rhettjay/ruck.git
# or
gh repo clone rhettjay/ruck

# Define an XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/dotfiles

# Copy everything over or source it in
source ~/$XDG_CONFIG_HOME/.zsh
# or use symlinks
ln -s ~/$XDG_CONFIG_HOME/ ./ruck
```

## Got an idea?
PRs welcome

### TODO
- [ ] [Custom CLI Utilities --> scripts](./scripts) # Need to abstract them for more public consumption 
- [ ] Fix install utilities (using GNU stow or another similar utility). Right now I'm just setting up symlinks (`ln -s ./ruck .config/thing`)
- [ ] Fix bat config colorscheme
- [ ] Fix Neovim number column highlighting# Installation
- [ ] Retrofit zsh plugin manager
- [ ] Fix terminal text-encoding to handle reverse lookup
- [ ] Fix zle tab completion. Right now fzf is only activing on keybind
- [ ] Pull in other configs for zero-day start

# License
&copy; Rhett Bulkley
Released under the GNU General Public License, version 3 or later.
