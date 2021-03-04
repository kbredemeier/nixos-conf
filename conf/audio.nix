# Audio-specific packages.
{ config, pkgs, ... }: {
  # Load the sequencer and midi kernel modules.
  boot.kernelModules = ["snd-seq" "snd-rawmidi"];
  users.extraUsers.mindtree.extraGroups = [ "audio" "realtime" ];
}
