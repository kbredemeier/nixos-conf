{ config, pkgs, lib, ... }:
{
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

  # Allow unfree steam packages.
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
}
