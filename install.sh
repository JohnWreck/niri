#!/usr/bin/env bash

set -e

package=(

#alacritty
#bmon
#btop
#fd
#fzf
#git
#htop
#iftop
#iotop
#iperf3
#iptraf-ng
#lm_sensors
#lsd
#mpv
#ncdu
#neovim
#net-tools
#nethogs
#nmap
#nnn
#nvtop
#p7zip
#papirus-icon-theme
#rsync
#script
#syncthing
#thunderbird
#tmux
#transmission
#trash-cli
#whois
#wireshark
fuzzel
mako
niri
swaylock
waybar

)

sudo dnf update --refresh
sudo dnf install ${package[*]}
