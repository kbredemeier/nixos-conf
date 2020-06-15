{ config, pkgs, ... }:
{
  # Packages.
  environment.systemPackages = with pkgs; [
    linuxPackages.openrazer
  ];

  # Razer peripherals.
  hardware.openrazer.enable = true;
}
