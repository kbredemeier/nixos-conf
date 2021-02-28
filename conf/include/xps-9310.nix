# A top-level configuration expression ready for including in
# `/etc/nixos/configuration.nix`.
#
# Made specifically for personal use with the late 2020 Dell XPS 13 9310.
{ config, pkgs, ... }: {
  imports = [
    <nixos-hardware/dell/xps/13-9310>
    ../audio.nix
    ../conf.nix
    ../gaming.nix
    ../home-manager.nix
    ../users.nix
  ];

  # Enable Intel's Hybrid Driver.
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {
      enableHybridCodec = true;
    };
  };
}
