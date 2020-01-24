{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Packages.
  environment.systemPackages = with pkgs; [
    firefox
    tmux
    wget
    vim
  ];

  # Ensure exFAT support.
  boot.extraModulePackages = [
    config.boot.kernelPackages.exfat-nofuse
  ];

  # Networking.
  networking.hostName = "mindtree";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;
}
