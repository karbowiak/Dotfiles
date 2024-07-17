# Dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Installation
1. Clone this repository to your home directory.
```bash
git clone https://github.com/karbowiak/Dotfiles.git ~/Dotfiles
```
2. Change to the Dotfiles directory.
```bash
cd ~/Dotfiles
```
3. Backup your existing dotfiles.
```bash
cp ~/.zshrc ~/.zshrc.bak
cp ~/.zprofile ~/.zprofile.bak
cp ~/.vimrc ~/.vimrc.bak
cp ~/.tmux.conf ~/.tmux.conf.bak
cp ~/.gitconfig ~/.gitconfig.bak
```
(Handle other configurations like Settings.json for VSCode, Alacritty and OhMyPosh manually if you already have them installed.)

4. Install the dotfiles using the setup script (This will also install brew, packages etc. etc.)
```bash
./setup.sh
```
