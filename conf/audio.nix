# Audio-specific packages.
{ config, pkgs, ... }: {
  # Load the sequencer and midi kernel modules.
  boot.kernelModules = ["snd-seq" "snd-rawmidi"];
  users.extraUsers.mindtree.extraGroups = [ "audio" "realtime" ];

  # Enable sound.
  sound.enable = true;

  # Pulseaudio.
  # TODO: Replace this with `services.pipewire` after 0.3.23 or later lands.
  # Last test (at 0.3.18) bluetooth didn't work and pulse crashed in ardour.
  hardware.pulseaudio = {
    enable = true;
    # Full pulseaudio pkg to get bluetooth support.
    package = pkgs.pulseaudioFull;
  };
}
