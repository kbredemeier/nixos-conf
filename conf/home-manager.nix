# Enables `home-manager` module for home config.
{ pkgs, ... }:
let
  # Where the local repo is stored.
  local-repo = /home/mindtree/programming/nix/mindtree-home;

  # Where the remote repo is stored.
  git-repo = pkgs.fetchFromGitHub {
    owner = "mitchmindtree";
    repo = "mindtree-home";
    rev = "ea39231eece670f682697914c125a0bcddf0949e";
    sha256 = "1w17lf7nyas1p1cgflddf5838m6hg41as8rap8m4xq9nrch7hdr7";
  };

  # Prefer the local "up-to-date" repo if available.
  home-repo =
    if builtins.pathExists local-repo then local-repo else (import git-repo);

  # Create a wrapper module with the desired configuration.
  mindtree-home = { ... }: {
    imports = [ home-repo ];
    # Enable the desktop environment.
    mindtree.de.enable = true;
  };

in {
  imports = [
    ''${(import ./channels.nix).home-manager}/nixos''
  ];
  home-manager.users.mindtree = mindtree-home;
}
