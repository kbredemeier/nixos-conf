{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    cataclysm-dda
    lutris
    minecraft
    protontricks
    wine-staging # For testing `auracle` sound card control software from iConnectivity.
  ];
}
