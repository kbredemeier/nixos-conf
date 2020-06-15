# Intel-specific packages.
{ config, pkgs, ... }:
{
  # OpenGL (WebGL, video-accel).
  hardware.opengl = {
    extraPackages = with pkgs; [
      vaapiIntel
      intel-media-driver
    ];
  };

  # Enable Intel's Hybrid Driver.
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {
      enableHybridCodec = true;
    };
  };
}
