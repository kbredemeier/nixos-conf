# A top-level configuration expression ready for including in
# `/etc/nixos/configuration.nix`.
#
# Made specifically for personal use with the late 2020 Dell XPS 13 9310.
{ config, pkgs, ... }:
let
  # TODO: Switch to a stable nixos-hardware channel once this has landed.
  # nixos-hardware = /home/mindtree/programming/nix/nixos-hardware;
  nixos-hardware = builtins.fetchGit {
    url = "https://github.com/mitchmindtree/nixos-hardware.git";
    ref = "xps-9310";
    rev = "f361f64db031dcc13e7d3bfe0c2e939ba220e7aa";
  };
in
  {
    imports = [
      ''${nixos-hardware}/dell/xps/13-9310''
      ../audio.nix
      ../conf.nix
      ../gaming.nix
      ../home-manager.nix
      ../users.nix
    ];

    # XPS 13 9310 requires unfree firmware for wifi/bluetooth.
    nixpkgs.config.allowUnfree = true;

    # Enable Intel's Hybrid Driver.
    nixpkgs.config.packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override {
        enableHybridCodec = true;
      };
    };
  }
