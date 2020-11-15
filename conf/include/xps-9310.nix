# A top-level configuration expression ready for including in
# `/etc/nixos/configuration.nix`.
#
# Made specifically for personal use with the late 2020 Dell XPS 13 9310.
{ config, pkgs, ... }:
let
  # TODO: Switch to a stable nixos-hardware channel once this has landed.
  nixos-hardware = builtins.fetchGit {
    url = "https://github.com/mitchmindtree/nixos-hardware.git";
    ref = "xps-9310-no-wifi";
    rev = "c3f2189bf172888219542cce1e29916b961514fa";
    # Change to this branch and the `rev` of the latest commit on that branch
    # to test wi-fi.
    # ref = "xps-9310";
  };
in
  {
    imports = [
      ''${nixos-hardware}/dell/xps/13-9310''
      ../conf.nix
      ../home-manager.nix
      ../intel.nix
      ../users.nix
    ];

    # XPS 13 9310 requires unfree firmware for wifi/bluetooth.
    nixpkgs.config.allowUnfree = true;
  }
