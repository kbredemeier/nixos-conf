{
  home-manager = builtins.fetchTarball {
    # release-20.09
    url = "https://github.com/nix-community/home-manager/archive/209566c752c4428c7692c134731971193f06b37c.tar.gz";
    sha256 = "1canlfkm09ssbgm3hq0kb9d86bdh84jhidxv75g98zq5wgadk7jm";
  };
  nixos-hardware = builtins.fetchTarball {
    url = "https://github.com/nixos/nixos-hardware/archive/31f61b90ddb9257b94888ee17ccf96236e180c76.tar.gz";
    sha256 = "0f1yis402d2p62v066vdqqyhwx07hpyijsplk362x9mgqd9wm9cf";
  };
  # TODO: Work out how to pin nixpkgs like this...
  # nixpkgs = builtins.fetchTarball {
  #   url = "https://github.com/nixos/nixpkgs/archive/f5e8bdd07d1afaabf6b37afc5497b1e498b8046f.tar.gz";
  #   sha256 = "0f1yis402d2p62v066vdqqyhwx07hpyijsplk362x9mgqd9wm9ca";
  # };
}
