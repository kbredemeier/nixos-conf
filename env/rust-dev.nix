# An expression producing an environment suitable for rust & nannou dev.
with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "rust-dev";
  buildInputs = [
    alsaLib
    binutils
    cargo-deps # visualise dep graph
    cargo-generate # wasm tute
    cmake
    gcc
    gnumake
    graphviz # visualise dep graph (cargo-deps)
    kcachegrind
    libGL # For camera_capture example.
    libv4l # video4linux
    libudev
    nodejs # For Rust+JS+WASM dev.
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
    wasm-pack # For building, testing, publishing rust-generated wasm.
  ];
  LD_LIBRARY_PATH = "${vulkan-loader}/lib:${xorg.libX11}/lib:${xorg.libXcursor}/lib:${xorg.libXi}/lib:${xorg.libXrandr}/lib:${libGL}/lib:$LD_LIBRARY_PATH";
  ALSA_LIB_DEV = "${alsaLib.dev}"; #
  SHADERC_LIB_DIR = "${shaderc}/lib";
}
