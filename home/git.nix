{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "mitchmindtree";
    userEmail = "mitchell.nordine@gmail.com";
  };
}
