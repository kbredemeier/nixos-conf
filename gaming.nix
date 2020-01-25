{ config, pkgs, ... }:
{
  # Packages.
  environment.systemPackages = with pkgs; [
    cataclysm-dda
    minecraft
    steam
  ];

  # Steam requires unfree.
  # TODO: Work out how to make this specifically just steam.
  nixpkgs.config.allowUnfree = true;

  # Steam requirements.
  hardware.opengl = {
    driSupport = true;
    extraPackages = with pkgs; [ libva ];
    driSupport32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  };
  hardware.pulseaudio.support32Bit = true;
}
