{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Use the latest linux kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Packages.
  environment.systemPackages = with pkgs; [
    (arduino.override { withTeensyduino = true; })
    blender
    deluge
    exercism
    ffmpeg
    flatpak-builder # required by gnome-builder for building gnome-music
    firefox-wayland
    fractal
    gdb
    gimp
    git
    glxinfo
    gnome-builder
    gnome3.adwaita-icon-theme
    gnome3.gnome-books
    gnome3.gnome-tweak-tool
    gnome3.gnome-power-manager
    graphviz
    inetutils # ftp for working with dante brooklyn II
    inkscape
    kicad
    libreoffice
    libva-utils
    nodejs
    obinskit # Anne Pro 2 configuration.
    protonvpn-cli
    reaper
    rustup
    screen # to login to chip via serial
    signal-desktop
    soulseekqt
    spotify
    supercollider
    sysprof
    teensyduino # temporarily testing tmcstepper lib
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

  # Gnome 3 trackers for indexing e-books.
  services.gnome3.tracker.enable = true;
  services.gnome3.tracker-miners.enable = true;

  # Enable wireshark.
  programs.wireshark.enable = true;

  # Teensy MCU UDEV rules.
  services.udev.extraRules = ''
    # UDEV rules for Teensy USB devices
    ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", ENV{ID_MM_DEVICE_IGNORE}="1"
    ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789A]?", ENV{MTP_NO_PROBE}="1"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789ABCD]?", MODE:="0666"
    KERNEL=="ttyACM*", ATTRS{idVendor}=="16c0", ATTRS{idProduct}=="04[789B]?", MODE:="0666"

    # UDEV rules for the ST-LINK/V2.1.
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374a", MODE:="0666", SYMLINK+="stlinkv2-1_%n"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE:="0666", SYMLINK+="stlinkv2-1_%n"

    # UDEV rules for the ST-LINK/V1. (Unsure if working)
    ATTRS{idProduct}=="3744", ATTRS{idVendor}=="0483", MODE="666", GROUP="plugdev"

    # UDEV rules (total guess) for the Hitex programmer on the stm32-comstick. (Never worked)
    ATTRS{idProduct}=="0033", ATTRS{idVendor}=="0640", MODE="666", GROUP="plugdev"
  '';

  # Add the laser sollinger root CA certificate for their git server.
  security.pki.certificates = [
    (builtins.readFile /etc/ssl/certs/LA-root-CA.crt)
  ];
}
