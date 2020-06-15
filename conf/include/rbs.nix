# A top-level configuration expression ready for including in
# `/etc/nixos/configuration.nix`.
#
# Made specifically for personal use with 2016 "new" razer blade stealth.
{ config, pkgs, ... }:
{
  imports = [
    ../conf.nix
    ../intel.nix
    ../gaming.nix
    ../users.nix
    ../virtualbox.nix
  ];
}
