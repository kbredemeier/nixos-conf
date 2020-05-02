{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Use the latest linux kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Packages.
  environment.systemPackages = with pkgs; [
    arduino
    cmatrix
    deluge
    exercism
    ffmpeg
    firefox-wayland
    fractal
    gcolor3
    gdb
    gimp
    git
    glxinfo
    gnome3.adwaita-icon-theme
    gnome3.gnome-tweak-tool
    graphviz
    inkscape
    kicad
    libva-utils
    nodejs
    protonvpn-cli
    reaper
    rustup
    screen # to login to chip via serial
    signal-desktop
    soulseekqt
    spotify
    supercollider
    tree
    tmux
    usbutils # lsusb
    vim_configurable
    vlc
    vulkan-tools
    wget
    wireshark
    xournal
  ];

  # OpenGL (WebGL, video-accel).
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      libvdpau-va-gl
      vaapiVdpau
    ];
  };

  # Networking.
  networking.hostName = "mindtree";

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    # Ether dream DAC communication.
    7765
  ];
  networking.firewall.allowedUDPPorts = [
    # Ether dream DAC broadcasts.
    7654
    # nannou OSC example.
    34254
  ];

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

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

  # Enable wireshark.
  programs.wireshark.enable = true;
}
