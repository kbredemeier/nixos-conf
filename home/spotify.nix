{ config, pkgs, ... }: {
  home.packages = with pkgs; [ spotify ];
  nixpkgs.config.allowUnfree = true;
}
