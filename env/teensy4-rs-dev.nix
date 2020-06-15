# An expression producing an environment suitable for rust & nannou dev.
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "teensy4-rs-dev";
  buildInputs = [
    binutils
    gcc-arm-embedded
    jq
    teensy-loader-cli
  ];
}
