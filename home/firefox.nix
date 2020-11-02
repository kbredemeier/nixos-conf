{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    # TODO Add extensions here. See:
    # https://github.com/nix-community/home-manager/blob/a98ec6ec158686387d66654ea96153ec06be33d7/modules/programs/firefox.nix#L94
  };
}
