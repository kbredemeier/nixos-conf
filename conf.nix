{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Packages.
  environment.systemPackages = with pkgs; [
    arduino
    ffmpeg
    firefox
    gdb
    gimp
    git
    gnome3.gnome-tweak-tool
    graphviz
    idris
    inkscape
    kicad
    reaper
    rustup
    tmux
    vim
    vulkan-headers
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    wget
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

  # Enable bluetooth.
  hardware.bluetooth.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    # Full pulseaudio pkg to get bluetooth support.
    package = pkgs.pulseaudioFull;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;
}
