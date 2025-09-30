#!/usr/bin/env bash

set -o errexit

update_pacman_packages() {
  sudo pacman -Syu
}

install_packages() {
  PACKAGES="$(sed '/^$/d' packages/install-list)"
  echo "$PACKAGES" | sudo pacman -S -
}

install_yay() {
  pushd >/dev/null
  git -C /tmp clone https://aur.archlinux.org/yay.git
  cd /tmp/yay && makepkg -si
  popd >/dev/null
}

create_default_folders() {
  mkdir -p ~/.config
  mkdir -p ~/Downloads ~/Documents ~/Pictures ~/Music ~/Videos
  mkdir -p ~/Pictures/Wallpapers ~/Pictures/Screenshots
  cp -r wallpapers/* ~/Pictures/Wallpapers/
}

copy_dotfiles() {
  cp -r .config/* ~/.config/
}

set_login_shell() {
  chsh -s /usr/bin/fish
}

remove_unused_packages() {
  UNUSED_PACKAGES="$(sed '/^$/d' packages/remove-list)"
  echo "$UNUSED_PACKAGES" | sudo pacman -R --noconfirm -
}

enable_daemons() {
  sudo systemctl enable iwd
  sudo systemctl enable dhcpcd
  sudo systemctl enable bluetooth
  sudo systemctl enable NetworkManager
  sudo systemctl enable gdm
}

update_pacman_packages
install_packages
install_yay

create_default_folders
copy_dotfiles
set_login_shell

remove_unused_packages
enable_daemons
