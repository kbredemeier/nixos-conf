{ config, pkgs, ... }: {
  home.packages = with pkgs; [ soulseekqt ];
  nixpkgs.config.allowUnfree = true;
}
