{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      vi = "vim";
      elmdir = "cd ~/programming/elm/";
      haskell = "cd ~/programming/haskell";
      idrisdir = "cd ~/programming/idris";
      jen = "cd ~/programming/rust/jen";
      rust = "cd ~/programming/rust/";
      rust-dev = "nix-shell /etc/nixos/mindtree/env/rust-dev.nix";
      idris-dev = "cd ~/programming/idris/ && nix-shell";
      trash = "gio trash";
      teensy4-rs-dev = "nix-shell /etc/nixos/mindtree/env/teensy4-rs-dev.nix";
      stlink-dev = "nix-shell /etc/nixos/mindtree/env/stlink-dev.nix";
    };
  };
}
