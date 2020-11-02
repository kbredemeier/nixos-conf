# Top-level expression for inclusion in
# `/home/mindtree/.config/nixpkgs/home.nix`
{ config, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./firefox.nix
    ./git.nix
    ./soulseekqt.nix
    ./spotify.nix
    #./teensyduino.nix
    ./tmux.nix
    ./vim/vim.nix
  ];

  home = {
    # Packages without any special config.
    packages = with pkgs; [
      arduino
      blender
      deluge
      exercism
      ffmpeg
      flatpak-builder # required by gnome-builder for building gnome-music
      fractal
      gdb
      gimp
      glxinfo
      gnome-builder
      gnome3.adwaita-icon-theme
      gnome3.gnome-books
      gnome3.gnome-tweak-tool
      gnome3.gnome-power-manager
      gnome3.gnome-todo
      graphviz
      inetutils # ftp for working with dante brooklyn II
      inkscape
      ipfs
      kicad
      libreoffice
      libva-utils
      netcat # For sending basic TCP packets.
      nixfmt
      nodejs
      #obinskit # Anne Pro 2 configuration.
      protonvpn-cli
      rustup
      screen # to login to chip via serial
      signal-desktop
      sysprof
      tree
      usbutils # lsusb
      vlc
      vulkan-tools
      wget
      wireshark
      xournal
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
}
