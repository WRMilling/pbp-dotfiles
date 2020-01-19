#!/usr/bin/env bash

function print_header() {
  echo "##############################"
  echo $1
  echo "##############################"
}

# Linux Setup
print_header "Get arch up to date and install a few utils"
sudo pacman -Syyu
sudo pacman -S vim htop tmux git base-devel

print_header "Install yadm and clone the dotfiles repo"
sudo pacman -S yay
yay -S yadm

yadm clone git@github.com:WRMilling/pbp-dotfiles.git
yadm submodule init
yadm submodule update --recursive

print_header "Using yadm bootstrap to complete setup"
yadm bootstrap
