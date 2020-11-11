# A top-level configuration expression ready for including in
# `/etc/nixos/configuration.nix`.
#
# Made specifically for personal use with the late 2020 Dell XPS 13 9310.
{ config, pkgs, ... }:
{
  imports = [
    ../conf.nix
    ../home-manager.nix
    ../intel.nix
    ../users.nix
  ];
}
