# mindtree NixOS setup

Collection of useful nix expressions.

- `./conf/` - expressions useful for configuration.
- `./conf/include/` - pre-curated sets of configuration expressions ready for
  importing into `/etc/nixos/configuration.nix`.
- `./env/` - useful shells, normally development environments, ready for use
  with `nix-shell <path>`.

## Usage

Clone into the nix configuration directory.

```
cd /etc/nixos/
git clone git@github.com:mitchmindtree/nixconf.git mindtree
```

Add `./mindtree/conf/include/<choose_a_config>.nix` to the imports within
`/etc/nixos/configuration.nix`
