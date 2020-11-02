# Enables `home-manager` module for home config.
{ config, pkgs, ... }:
{
  imports = [ <home-manager/nixos> ];
  home-manager.users.mindtree = ../home/home.nix;
}
