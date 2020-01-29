{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Use the latest linux kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Packages.
  environment.systemPackages = with pkgs; [
    arduino
    deluge
    ffmpeg
    firefox
    gdb
    gimp
    git
    gnome3.adwaita-icon-theme
    gnome3.gnome-tweak-tool
    graphviz
    idris
    inkscape
    kicad
    reaper
    rustup
    soulseekqt
    tree
    tmux
    vim
    virtualbox
    vulkan-tools
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
