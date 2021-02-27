{ config, pkgs, ... }:
{
  # Steam requires unfree.
  # TODO: Work out how to make this specifically just steam.
  nixpkgs.config.allowUnfree = true;

  # Steam requirements.
  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ libva ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    pulseaudio.support32Bit = true;
  };

  # Includes the package along with "a few other workarounds" like controller support.
  programs.steam.enable = true;
}
