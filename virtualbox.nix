{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    virtualbox
  ];
  
  # Virtualbox
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  # Oracle Extensions
  nixpkgs.config.allowUnfree = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
