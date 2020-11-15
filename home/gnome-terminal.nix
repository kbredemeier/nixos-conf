{ config, pkgs, ... }: {
  programs.gnome-terminal = {
    enable = true;
    profile = {
      mindtree = {
        visibleName = "mindtree";
        showScrollbar = false;
      };
    };
  };
}
