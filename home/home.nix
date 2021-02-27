# Top-level expression for inclusion in
# `/home/mindtree/.config/nixpkgs/home.nix`
{ config, pkgs, lib, ... }:
{
  imports = [
    ./bash.nix
    ./firefox.nix
    ./git.nix
    ./gnome-terminal.nix
    ./gtk.nix
    #./teensyduino.nix
    ./tmux.nix
    ./vim/vim.nix
  ];

  home = {
    # Packages without any special config.
    packages = with pkgs; [
      arduino
      bitwarden
      # blender
      deluge
      faudio # DirectX audio wrapper for skyrim
      ffmpeg
      gdb
      gimp
      glxinfo
      gnome3.adwaita-icon-theme
      gnome3.gnome-bluetooth
      gnome3.gnome-power-manager
      gnome3.gnome-todo
      gnome3.gnome-tweak-tool
      graphviz
      gst_all_1.gst-libav # trying to get AIFF files working in nautilus preview
      gst_all_1.gst-plugins-bad # trying to get AIFF files working in nautilus preview
      inetutils # ftp for working with dante brooklyn II
      inkscape
      ipfs
      iw # For trying to debug why my wifi device won't show
      kicad
      libreoffice
      libva-utils
      netcat # For sending basic TCP packets.
      nixfmt
      nmap-graphical
      nodejs
      obinskit # Anne Pro 2 configuration.
      pciutils # Provides lspci - added to debug wifi not working
      platformio # For running daniel's arduino sketch for morph power supply mgmt.
      protonvpn-cli
      protontricks
      rustup
      screen # to login to chip via serial
      signal-desktop
      soulseekqt
      spotify
      steam-run
      sysbench
      sysprof
      tree
      unrar
      usbutils # lsusb
      vlc
      vulkan-tools
      wget
      wine-staging # For testing `auracle` sound card control software from iConnectivity.
      wireshark

      # TODO Move these to a separate gaming list.
      cataclysm-dda
      lutris
      minecraft
    ];

    # Add some dirs to PATH.
    sessionPath = [
      "~/.cabal/bin"
      "~/.cargo/bin"
      "~/.local/bin"
      "~/applications"
    ];

    # ENV vars that should always be present.
    sessionVariables = {
      EDITOR = "${config.home.sessionVariables.VISUAL}";
      VISUAL = "vim";
    };
  };

  nixpkgs.config = {
    # Required to allow obinskit to build.
    permittedInsecurePackages = [
      "electron-3.1.13"
    ];

    # Allow only specific unfree packages.
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "minecraft-launcher"
      "obinskit"
      "soulseekqt"
      "spotify"
      "spotify-unwrapped"
      "steam"
      "steam-original"
      "steam-runtime"
      "unrar"
    ];
  };
}
