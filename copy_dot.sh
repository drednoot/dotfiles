#!/bin/sh

dotdir="$HOME/Documents/arch_dotfiles/"

cp -v ~/.xbindkeysrc $dotdir
cp -v ~/.xinitrc $dotdir
cp -v ~/.Xresources $dotdir
cp -v ~/.zshrc $dotdir
cp -v -r ~/.config/vifm/ "$dotdir.config/"
cp -v -r ~/.config/nvim/ "$dotdir.config/"
cp -v -r ~/.config/mpv/ "$dotdir.config/"

