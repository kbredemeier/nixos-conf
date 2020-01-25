{ config, pkgs, ... }:
{
  # Packages.
  environment.systemPackages = with pkgs; [
    steam
  ];

  # Steam requires unfree.
  # TODO: Work out how to make this specifically just steam.
  nixpkgs.config.allowUnfree = true;

  # Steam requirements.
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
}
