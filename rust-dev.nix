# An expression producing an environment suitable for rust & nannou dev.
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rust-dev";
  buildInputs = [
    alsaLib
    binutils
    cmake
    gcc
    gnumake
    kcachegrind
    libGL # for camera_capture example
    libv4l # video4linux
    libudev
    openssl
    pkgconfig
    python3
    renderdoc
    rust-bindgen
    shaderc
    valgrind
    vulkan-loader
    vulkan-validation-layers
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
  LD_LIBRARY_PATH = "${vulkan-loader}/lib:${xorg.libX11}/lib:${xorg.libXcursor}/lib:${xorg.libXi}/lib:${xorg.libXrandr}/lib:${libGL}/lib:$LD_LIBRARY_PATH";
  ALSA_LIB_DEV = "${alsaLib.dev}"; #
  SHADERC_LIB_DIR = "${shaderc}/lib";
}
