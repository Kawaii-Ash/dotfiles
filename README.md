# Dotfiles

## Installing dotfiles

`./install`

## Installing NixOS

**Apply disk layout and mount (will erase all data):**

`nix run ./nixos#disko -- --mode destroy,format,mount --flake ./nixos#hostname`

**Install NixOS:**

`sudo nixos-install --flake ./nixos#hostname`
