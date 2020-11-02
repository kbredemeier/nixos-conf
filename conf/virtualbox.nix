{ config, pkgs, ... }:
{
  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "mindtree" ];
  users.extraUsers.mindtree.extraGroups = [ "vboxusers" ];

  # Oracle Extensions
  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
