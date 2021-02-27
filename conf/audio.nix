# Audio-specific packages.
{ config, pkgs, ... }:
{
  # Packages.
  environment.systemPackages = with pkgs; [
    ardour
    mixxx # DJ mixer
    supercollider
    yoshimi # Plugin
    zam-plugins # Some random plugins I'm about to try
    zynaddsubfx # Plugin
  ];

  # Load the sequencer and midi kernel modules.
  boot.kernelModules = ["snd-seq" "snd-rawmidi"];

  users.extraUsers.mindtree.extraGroups = [ "audio" "realtime" ];
}
