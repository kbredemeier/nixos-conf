# Audio-specific packages.
{ config, pkgs, ... }:
{
  # Packages.
  environment.systemPackages = with pkgs; [
    ardour
    cadence # Trying out, alternative to qjackctl it seems?
    mixxx # DJ mixer
    pamixer # pulseaudio cli mixer
    pavucontrol # pulseaudio mixer
    qjackctl # Trying to start jack server from user.
    reaper
    supercollider
    yoshimi # Plugin
    zam-plugins # Some random plugins I'm about to try
    zynaddsubfx # Plugin
  ];

  # # The jack module.
  # services.jack = {
  #   jackd.enable = true;
  #   # support ALSA only programs via ALSA JACK PCM plugin
  #   alsa.enable = false;
  #   # support ALSA only programs via loopback device (supports programs like Steam)
  #   loopback = {
  #     enable = true;
  #   };
  # };

  # Load the sequencer and midi kernel modules.
  boot.kernelModules = ["snd-seq" "snd-rawmidi"];

  users.extraUsers.mindtree.extraGroups = [ "audio" "jackaudio" "realtime" ];
}
