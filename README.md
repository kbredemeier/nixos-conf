# mindtree NixOS setup

Collection of useful nix expressions.

- `./conf/` - expressions useful for system configuration.
- `./conf/include/` - pre-curated sets of system configuration expressions ready
  for importing into `/etc/nixos/configuration.nix`.
- `./env/` - useful shells, normally development environments, ready for use
  with `nix-shell <path>`.
- `./home/home.nix` - All user-specific configuration including packages and
  dotfiles. This is the file pointed to by `./confo/home-manager.nix` for the
  main home-manager config.

## Usage

Clone into the nix configuration directory.

```
$ cd /etc/nixos/
$ git clone git@github.com:mitchmindtree/nixconf.git mindtree
```

Add `./mindtree/conf/include/<choose_a_config>.nix` to the imports within
`/etc/nixos/configuration.nix`

If the chosen config requires `home-manager`, first add the necessary nix
channel. Check the version matches the desired nixos version.

```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
$ nix-channel --update home-manager
```
