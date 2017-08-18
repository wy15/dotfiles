# dotfiles

Fork from Sebastian Dahlgren, thks very much for his work!

Fit my ENV, neovim, and other.

Awesome dotfiles for this and that!

## Dependencies

- [Homebrew](http://brew.sh/)
- neovim (install via `brew`)
- tmux (install via `brew`)
- ack (install via `brew`)

### tmux dependencies

For OS X copy super powers

    brew install reattach-to-user-namespace

~~## Installation~~

~~Install the dotfiles~~

~~./install.sh~~

## Manual installation

* pre1: If you don't have python3 and neovim, install it.

```
For OS X

brew install python3
brew install neovim --HEAD

For archlinux

sudo pacman -S python neovim
```

* pre2: Install virtualenvwrap , python3 version

```
pip3 or pip install --user virtualenvwrap

add virtualenvwrap's bin to path and export it ,before plugins.

add virtualenvwrap to oh-my-zsh's plugins

export VIRTUALENVWRAPPER_PYTHON="see pre1"
export VIRTUALENVWRAPPER_VIRTUALENV="see pre1"
```

* pre3: Create virtualenv ,named neovim, and install all needed modules.

```
mkvirtualenv neovim -p python3
pip install -U neovim isort jedi yapf pylama
```

* pre4: Download source code.

```
git clone https://github.com/xiaobagou/dotfiles.git
cp -r config/* ~/.config/
```

* Init:

```
//In command line
//Ignore the error
$ nvim
:PlugInstall
//Restart nvim
//for vim-go, make sure that you have install go and config it.
:GoInstallBinaries
```
